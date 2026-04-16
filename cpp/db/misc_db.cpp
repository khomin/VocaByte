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

MiscDb::MiscDb(std::string path) {
    db_path = path;
    if(open_db() != SQLITE_OK) {
        LOG_F(INFO, "failed to open db");
    }
}

MiscDb::~MiscDb() {
    close_db();
    waitUntilClose();
}

std::vector<MiscDb::Word> MiscDb::getRecent() {
    std::vector<MiscDb::Word> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
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
    return res;
}

void MiscDb::putRecent(std::string word, std::string json) {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
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
}

std::vector<MiscDb::WordCurrent> MiscDb::getCurrentToStudy(uint64_t now) {
    std::vector<MiscDb::WordCurrent> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    try {
        query = NativeLibConverter::format(
                "SELECT* FROM current_words " \
                "WHERE max(last_tm_success, last_tm_fail) + next_review_tm <= %ld " \
                "AND success_count < 10",
                now
        );
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
                    if(sqlite3_column_count(stmt) > 6) {
                        auto m_id_str = sqlite3_column_text(stmt, 6);
                        if(m_id_str != nullptr) {
                            it.meaning_id = std::string((const char*) m_id_str);
                        }
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
    return res;
}

std::vector<MiscDb::Word> MiscDb::getDictionary(std::string word, bool useLike) {
    std::vector<MiscDb::Word> res;
    sqlite3_stmt *stmt;
    std::lock_guard<std::mutex> lock(m_lock);
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
    return res;
}

std::vector<MiscDb::Word> MiscDb::getDictionaryRand(int count) {
    std::vector<MiscDb::Word> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
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
    return res;
}

void MiscDb::addCurrent(std::string word) {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    query = NativeLibConverter::format(
        "INSERT INTO current_words (word) "\
        "SELECT word FROM dictionary WHERE word = LOWER('%s')",
        word.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed add word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
}

void MiscDb::addCurrentWithData(WordCurrent word){
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    query = NativeLibConverter::format(
        "INSERT INTO current_words (word, success_count, fail_count, last_tm_success, last_tm_fail, next_review_tm, meaning_id) "\
        "SELECT word, %lld, %lld, %lld, %lld, %lld, '%s' FROM dictionary WHERE word = LOWER('%s')",
        word.success_count, word.fail_count, word.last_tm_success,
        word.last_tm_fail, word.next_review_tm,
        word.meaning_id.c_str(),
        word.word.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed add word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
}

void MiscDb::updateCurrent(MiscDb::WordCurrent word) {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    query = NativeLibConverter::format(
        "UPDATE current_words SET success_count = %lld, fail_count = %lld, last_tm_success = %lld, last_tm_fail = %lld, next_review_tm = %lld, meaning_id='%s' " \
        "WHERE word = LOWER('%s')",
        word.success_count, word.fail_count,
        word.last_tm_success, word.last_tm_fail,
        word.next_review_tm,
        word.meaning_id.c_str(),
        word.word.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed put recent words: [%s]", TAG, sqlite3_errmsg(m_db));
    }
}

std::optional<MiscDb::WordCurrent> MiscDb::getCurrentExact(std::string word) {
    MiscDb::WordCurrent res{};
    sqlite3_stmt *stmt;
    std::string query;
    bool success = false;
    std::lock_guard<std::mutex> lock(m_lock);
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
                    // word
                    if(sqlite3_column_text(stmt, 0) != nullptr) {
                        res.word = std::string((char*)sqlite3_column_text(stmt, 0));
                    }
                    res.success_count = sqlite3_column_int64(stmt, 1);
                    res.fail_count = sqlite3_column_int64(stmt, 2);
                    res.last_tm_success = sqlite3_column_int64(stmt, 3);
                    res.last_tm_fail = sqlite3_column_int64(stmt, 4);
                    res.next_review_tm = sqlite3_column_int64(stmt, 5);
                    if(sqlite3_column_count(stmt) > 6) {
                        auto m_id_str = sqlite3_column_text(stmt, 6);
                        if(m_id_str != nullptr) {
                            res.meaning_id = std::string((const char*) m_id_str);
                        }
                    }
                    success = true;
                }
            }
        } else {
            LOG_F(INFO, "%s: failed get words: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed get words-ex: [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    if(success) {
        return res;
    }
    return std::nullopt;
}

void MiscDb::deleteCurrentExact(std::string word) {
    std::shared_ptr<MiscDb::WordCurrent> res;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    query = NativeLibConverter::format(
        "DELETE FROM current_words " \
        "WHERE word = LOWER('%s')",
        word.c_str()
    );
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed remove word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
}

std::vector<MiscDb::WordCurrent> MiscDb::getCurrentLimit(int limit, int offset, int useSuccessCount) {
    std::vector<MiscDb::WordCurrent> res;
    sqlite3_stmt *stmt;
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
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
                    if(sqlite3_column_count(stmt) > 6) {
                        auto m_id_str = sqlite3_column_text(stmt, 6);
                        if(m_id_str != nullptr) {
                            it.meaning_id = std::string((const char*) m_id_str);
                        }
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
    return res;
}

MiscDb::MetaData MiscDb::getMetadata() {
    sqlite3_stmt *stmt;
    MetaData res {};
    std::lock_guard<std::mutex> lock(m_lock);
    try {
        auto query = std::string("SELECT version FROM meta_data");
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, nullptr) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    res.version = sqlite3_column_int(stmt, 0);
                }
            }
        } else {
            LOG_F(INFO, "%s: failed: [%s]", TAG, sqlite3_errmsg(m_db));
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    return res;
}

bool MiscDb::checkReviewLimit(uint32_t limit) {
    sqlite3_stmt *stmt;
    int count = 0;
    try {
        auto query = std::string("SELECT COUNT(*) FROM review_log WHERE review_time > datetime('now', '-24 hours');");
        if(sqlite3_prepare_v2(m_db, query.c_str(), -1, &stmt, nullptr) == SQLITE_OK) {
            while ((sqlite3_step(stmt)) == SQLITE_ROW) {
                if(sqlite3_column_count(stmt) > 0) {
                    count = sqlite3_column_int(stmt, 0);
                }
            }
        }
    } catch(std::exception & ex) {
        LOG_F(INFO, "%s: failed [%s]", TAG, ex.what());
    }
    sqlite3_finalize(stmt);
    return count < limit;
}

void MiscDb::logReview() {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    query = "INSERT INTO review_log DEFAULT VALUES;";
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed [%s]", TAG, sqlite3_errmsg(m_db));
    }
}

void MiscDb::deleteAll() {
    std::string query;
    std::lock_guard<std::mutex> lock(m_lock);
    query = "DELETE FROM recent;" \
            "DELETE FROM current_words";
    if(sqlite3_exec(m_db, query.c_str(), nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed remove word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
}

int MiscDb::open_db() {
    std::string path;
    std::lock_guard<std::mutex> lock(m_lock);
    path = db_path + "/" + std::string(DB_FILE_PRIMARY_NAME);
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
    auto query= "CREATE TABLE  IF NOT EXISTS \"review_log\"" \
        "(\"id\" INTEGER," \
        "\"review_time\" DATETIME DEFAULT CURRENT_TIMESTAMP," \
        "PRIMARY KEY(\"id\" AUTOINCREMENT));";
    if(sqlite3_exec(m_db, query, nullptr, 0, nullptr) != SQLITE_OK) {
        LOG_F(INFO, "%s: failed remove word: [%s]", TAG, sqlite3_errmsg(m_db));
    }
    return 0;
}

int MiscDb::close_db() {
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
           close_db();
           break;
       }
       timeout++;
       std::this_thread::sleep_for(std::chrono::milliseconds(100));
   }
}
