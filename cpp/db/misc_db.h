#ifndef MISC_DB_H_
#define MISC_DB_H_

#include <string>
#include <vector>
#include <mutex>
#include <memory>
#include "ThirdParty/Sqlite/sqlite3.h"

class MiscDb {
public:
    MiscDb();
    ~MiscDb();

    struct Word {
        std::string word;
        uint64_t frequency;
        std::string json;
        std::string transcript;
    };

    struct WordCurrent {
        std::string word;
        uint64_t success_count;
        uint64_t fail_count;
        uint64_t last_tm_success;
        uint64_t last_tm_fail;
        uint64_t next_review_tm;
    };

    enum DB_type { Primary, Sentences };

    bool init(std::string path);

    std::vector<Word> getRecentWords();
    void putRecentWord(std::string word, std::string json);

    std::vector<WordCurrent> getReviewForToday();

    std::vector<Word> getWords(std::string word, bool useLike);
    std::vector<Word> getRandWords(int count);

    void addWordInReview(std::string word);
    void addWordInReview(WordCurrent word);

    void updateWordInReview(MiscDb::WordCurrent word);
    std::shared_ptr<WordCurrent> getWordInReview(std::string word);
    void removeWordInReview(std::string word);
    std::vector<WordCurrent> getWordInReviewList(int limit, int offset, int useSuccessCount);

    std::vector<std::string> getSentences(std::string word, uint32_t limit, uint32_t offset);

    void deleteAll();

private:
    void createTableIfNotExists();

    int open_db(DB_type type);
    int close_db(DB_type type);
    void waitUntilClose();

    sqlite3* m_db;
    std::mutex m_lock;
    std::string db_path;

    static constexpr const char* DB_FILE_PRIMARY_NAME = "database.db";
    static constexpr const char* DB_FILE_SENTENCES_NAME = "sentences.db";
    static constexpr const char* TAG = "MiscDb";
};

#endif // MISC_DB_H_

