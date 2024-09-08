#include <iostream>
#include <cstdlib>
#include <fstream>
#include <thread>
#include <regex>
#include "./misc_db.h"
#include "utils/converter.h"
#include "ThirdParty/loguru/loguru.hpp"

void regexpFunc(sqlite3_context* context, int argc, sqlite3_value** argv) {
    if (argc != 2) {
        sqlite3_result_int(context, 0);  // Needs exactly 2 arguments
        return;
    }
    const char* pattern = (const char*)sqlite3_value_text(argv[0]);
    const char* text = (const char*)sqlite3_value_text(argv[1]);
    if (!pattern || !text) {
        sqlite3_result_int(context, 0);  // Null arguments
        return;
    }

    try {
        std::regex re(pattern);
        if (std::regex_search(text, re)) {
            sqlite3_result_int(context, 1);
        } else {
            sqlite3_result_int(context, 0);
        }
    } catch (std::regex_error& e) {
        LOG_F(INFO, "regex error:: [%s]", e.what());
        sqlite3_result_int(context, 0);  // Invalid regular expression
    }
}

MiscDb::MiscDb(){}

MiscDb::~MiscDb() {
    waitUntilClose();
}

bool MiscDb::init(std::string path) {
    db_path = path;
    return true;
}

std::vector<MiscDb::Word> MiscDb::getRecentWords() {
    std::vector<MiscDb::Word> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return res;
    }
    try {
        query = "SELECT word FROM recent " \
                "WHERE id IS NOT NULL " \
                "ORDER BY recent.id DESC " \
                "LIMIT 50;";
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, NULL) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    auto word = MiscDb::Word();
                    // word
                    if(sqlite3_column_text(stmt, 0) != NULL) {
                        word.word= std::string((char*)sqlite3_column_text(stmt, 0));
                    }
                    // frequency
                    word.frequency = sqlite3_column_int64(stmt, 1);
                    // json
                    if(sqlite3_column_text(stmt, 2) != NULL) {
                        word.json = std::string((char*)sqlite3_column_text(stmt, 2));
                    }
                    // transcript
                    if(sqlite3_column_text(stmt, 3) != NULL) {
                        word.transcript = std::string((char*)sqlite3_column_text(stmt, 3));
                    }
                    res.push_back(word);
                }
            }
        } else {
            LOG_F(INFO, "%s: failed recent get words: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed get recent words-ex: [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    close_db(DB_type::Primary);
    return res;
}

void MiscDb::putRecentWord(std::string word, std::string json) {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return;
    }
    query = NativeLibConverter::format(
        "INSERT INTO recent  (word, json) VALUES (LOWER('%s'), '%s'); " \
        "DELETE FROM recent " \
        "WHERE id NOT IN (  " \
        "    SELECT DISTINCT id " \
        "        FROM recent " \
        "            WHERE id IS NOT NULL " \
        "                ORDER BY recent.id DESC " \
        "                    LIMIT 10 " \
        ")",
        word.c_str(), json.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed put recent words: [%s]", TAG, sqlite3_errmsg(m_db));
    }
    close_db(DB_type::Primary);
}

std::vector<MiscDb::WordCurrent> MiscDb::getReviewForToday() {
    std::vector<MiscDb::WordCurrent> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return res;
    }
    try {
        query = "SELECT* FROM current_words " \
                "WHERE max(last_tm_success, last_tm_fail) + next_review_tm <= strftime('%s', 'now') * 1000 " \
                "AND success_count < 10";
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, nullptr) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    auto it = MiscDb::WordCurrent();
                    // word
                    if(sqlite3_column_text(stmt, 0) != nullptr) {
                        it.word = std::string((char*)sqlite3_column_text(stmt, 0));
                    }
                    it.success_count = sqlite3_column_int64(stmt, 1);
                    it.fail_count = sqlite3_column_int64(stmt, 2);
                    it.last_tm_success = sqlite3_column_int64(stmt, 3);
                    it.last_tm_fail = sqlite3_column_int64(stmt, 4);
                    it.next_review_tm = sqlite3_column_int64(stmt, 5);
                    res.push_back(it);
                }
            }
        } else {
            LOG_F(INFO, "%s: failed get words: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed get words-ex: [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    close_db(DB_type::Primary);
    return res;
}

std::vector<MiscDb::Word> MiscDb::getWords(std::string word, bool useLike) {
    std::vector<MiscDb::Word> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return res;
    }
    try {
        std::string query;
        if(useLike) {
            query = NativeLibConverter::format(
                "SELECT * FROM dictionary WHERE word LIKE '%s%%' "\
                "ORDER BY frequency;",
                word.c_str()
            );
        } else {
            query = NativeLibConverter::format(
                "SELECT * FROM dictionary WHERE word = LOWER('%s') "\
                "ORDER BY frequency;",
                word.c_str(), "%"
            );
        }
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, nullptr) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    auto it = MiscDb::Word();
                    // word
                    if(sqlite3_column_text(stmt, 0) != nullptr) {
                        it.word = std::string((char*)sqlite3_column_text(stmt, 0));
                    }
                    // frequency
                    it.frequency = sqlite3_column_int64(stmt, 1);
                    // json
                    if(sqlite3_column_text(stmt, 2) != nullptr) {
                        it.json = std::string((char*)sqlite3_column_text(stmt, 2));
                    }
                    // transcript
                    if(sqlite3_column_text(stmt, 3) != nullptr) {
                        it.transcript = std::string((char*)sqlite3_column_text(stmt, 3));
                    }
                    res.push_back(it);
                }
            }
        } else {
            LOG_F(INFO, "%s: failed get words: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed get words-ex: [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    close_db(DB_type::Primary);
    return res;
}

std::vector<MiscDb::Word> MiscDb::getRandWords(int count) {
    std::vector<MiscDb::Word> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return res;
    }
    try {
        query = NativeLibConverter::format(
            "SELECT * FROM dictionary " \
            "ORDER BY RANDOM() " \
            "LIMIT %d", count
        );
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, nullptr) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    auto it = MiscDb::Word();
                    // word
                    if(sqlite3_column_text(stmt, 0) != nullptr) {
                        it.word = std::string((char*)sqlite3_column_text(stmt, 0));
                    }
                    // frequency
                    it.frequency = sqlite3_column_int64(stmt, 1);
                    // json
                    if(sqlite3_column_text(stmt, 2) != nullptr) {
                        it.json = std::string((char*)sqlite3_column_text(stmt, 2));
                    }
                    // transcript
                    if(sqlite3_column_text(stmt, 3) != nullptr) {
                        it.transcript = std::string((char*)sqlite3_column_text(stmt, 3));
                    }
                    res.push_back(it);
                }
            }
        } else {
            LOG_F(INFO, "%s: failed get words: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed get words-ex: [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    close_db(DB_type::Primary);
    return res;
}

void MiscDb::addWordInReview(std::string word) {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return;
    }
    query = NativeLibConverter::format(
        "INSERT INTO current_words (word) "\
        "SELECT word FROM dictionary WHERE word = LOWER('%s')",
        word.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed add word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
    close_db(DB_type::Primary);
}

void MiscDb::addWordInReview(WordCurrent word){
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return;
    }
    query = NativeLibConverter::format(
        "INSERT INTO current_words (word, success_count, fail_count, last_tm_success, last_tm_fail, next_review_tm) "\
        "SELECT word, %lld, %lld, %lld, %lld, %lld FROM dictionary WHERE word = LOWER('%s')",
        word.success_count, word.fail_count, word.last_tm_success,
        word.last_tm_fail, word.next_review_tm,
        word.word.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed add word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
    close_db(DB_type::Primary);
}

void MiscDb::updateWordInReview(MiscDb::WordCurrent word) {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return;
    }
    query = NativeLibConverter::format(
        "UPDATE current_words SET success_count = %lld, fail_count = %lld, last_tm_success = %lld, last_tm_fail = %lld, next_review_tm = %lld " \
        "WHERE word = LOWER('%s')",
        word.success_count, word.fail_count,
        word.last_tm_success, word.last_tm_fail,
        word.next_review_tm,
        word.word.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed put recent words: [%s]", TAG, sqlite3_errmsg(m_db));
    }
    close_db(DB_type::Primary);
}

std::shared_ptr<MiscDb::WordCurrent> MiscDb::getWordInReview(std::string word) {
    std::shared_ptr<MiscDb::WordCurrent> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return res;
    }
    try {
        query = NativeLibConverter::format(
            "SELECT * FROM current_words " \
            "WHERE word = LOWER('%s') " \
            "LIMIT 1",
            word.c_str()
        );
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, nullptr) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    res = std::make_shared<MiscDb::WordCurrent>();
                    // word
                    if(sqlite3_column_text(stmt, 0) != nullptr) {
                        res->word = std::string((char*)sqlite3_column_text(stmt, 0));
                    }
                    res->success_count = sqlite3_column_int64(stmt, 1);
                    res->fail_count = sqlite3_column_int64(stmt, 2);
                    res->last_tm_success = sqlite3_column_int64(stmt, 3);
                    res->last_tm_fail = sqlite3_column_int64(stmt, 4);
                    res->next_review_tm = sqlite3_column_int64(stmt, 5);
                }
            }
        } else {
            LOG_F(INFO, "%s: failed get words: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed get words-ex: [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    close_db(DB_type::Primary);
    return res;
}

void MiscDb::removeWordInReview(std::string word) {
    std::shared_ptr<MiscDb::WordCurrent> res;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return;
    }
    query = NativeLibConverter::format(
        "DELETE FROM current_words " \
        "WHERE word = LOWER('%s')",
        word.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed remove word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
    close_db(DB_type::Primary);
}

std::vector<MiscDb::WordCurrent> MiscDb::getWordInReviewList(int limit, int offset, int useSuccessCount) {
    std::vector<MiscDb::WordCurrent> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return res;
    }
    try {
        if(useSuccessCount > 0) {
            query = NativeLibConverter::format(
                "SELECT* FROM current_words WHERE success_count < 10 "\
                "LIMIT %d OFFSET %d",
                limit, offset
            );
        } else {
            query = NativeLibConverter::format(
                "SELECT* FROM current_words "\
                "LIMIT %d OFFSET %d",
                limit, offset
            );
        }
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, nullptr) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    auto it = MiscDb::WordCurrent();
                    if(sqlite3_column_text(stmt, 0) != nullptr) {
                        it.word = std::string((char*)sqlite3_column_text(stmt, 0));
                    }
                    it.success_count = sqlite3_column_int64(stmt, 1);
                    it.fail_count = sqlite3_column_int64(stmt, 2);
                    it.last_tm_success = sqlite3_column_int64(stmt, 3);
                    it.last_tm_fail = sqlite3_column_int64(stmt, 4);
                    it.next_review_tm = sqlite3_column_int64(stmt, 5);
                    res.push_back(it);
                }
            }
        } else {
            LOG_F(INFO, "%s: failed get words: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed get words-ex: [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    close_db(DB_type::Primary);
    return res;
}

std::vector<std::string> MiscDb::getSentences(std::string word, uint32_t limit, uint32_t offset) {
    std::vector<std::string> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Sentences) != SQLITE_OK) {
        return res;
    }
    try {
        query = NativeLibConverter::format(
            "SELECT *FROM 'text' WHERE body LIKE '%% %s %%' " \
            "LIMIT %d OFFSET %d;",
            word.c_str(),
            limit, offset
        );
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, nullptr) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    auto it = MiscDb::WordCurrent();
                    if(sqlite3_column_text(stmt, 1) != nullptr) {
                        res.push_back((char*)sqlite3_column_text(stmt, 1));
                    }
                }
            }
        } else {
            LOG_F(INFO, "%s: failed get sentences: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed get sentences-ex: [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    close_db(DB_type::Sentences);
    return res;
}

void MiscDb::deleteAll() {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    if(open_db(DB_type::Primary) != SQLITE_OK) {
        return;
    }
    query = "DELETE FROM recent;" \
            "DELETE FROM current_words";
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed remove word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
    close_db(DB_type::Primary);
}

int MiscDb::open_db(DB_type type) {
    std::string path;
    if(type == DB_type::Primary) {
        path = db_path + "/" + std::string(DB_FILE_PRIMARY_NAME);
    } else {
        path = db_path + "/" + std::string(DB_FILE_SENTENCES_NAME);
    }
    int rc = sqlite3_open(path.c_str(), &m_db);
    if(rc) {
        LOG_F(INFO, "%s: cannot open db: [%s]", TAG, sqlite3_errmsg(m_db));
        return 1;
    }
    rc = sqlite3_create_function(m_db, "REGEXP", 2, SQLITE_UTF8, nullptr, regexpFunc, nullptr, nullptr);
    if (rc) {
        std::cerr << "Can't create function: " << sqlite3_errmsg(m_db) << std::endl;
        sqlite3_close(m_db);
        return 1;
    }
    return 0;
}

int MiscDb::close_db(DB_type type) {
   if(m_db == NULL) {
       return -1;
   }
   sqlite3_close(m_db);
   m_db = NULL;
   return 0;
}

void MiscDb::waitUntilClose() {
   int timeout = 0;
   while(m_db != NULL) {
       if(timeout > 10) {
           LOG_F(INFO, "%s: cannot close db: [%s]", TAG, sqlite3_errmsg(m_db));
           close_db(DB_type::Primary);
           break;
       }
       timeout++;
       std::this_thread::sleep_for(std::chrono::milliseconds(100));
   }
}
