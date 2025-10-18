#ifndef MISC_DB_H_
#define MISC_DB_H_

#include <string>
#include <vector>
#include <mutex>
#include <memory>
#include <optional>
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
        std::string meaning_id;
    };

    struct MetaData {
        int version {};
    };

    enum DB_type { Primary, Sentences };

    bool init(std::string path);

    std::vector<Word> getRecent();
    void putRecent(std::string word, std::string json);

    std::vector<WordCurrent> getCurrentToStudy();
    
    std::vector<Word> getDictionary(std::string word, bool useLike);
    std::vector<Word> getDictionaryRand(int count);

    void addCurrent(std::string word);
    void addCurrentWithData(WordCurrent word);

    void updateCurrent(MiscDb::WordCurrent word);
    std::optional<WordCurrent> getCurrentExact(std::string word);
    void deleteCurrentExact(std::string word);
    std::vector<WordCurrent> getCurrentLimit(int limit, int offset, int useSuccessCount);

    MetaData getMetadata();

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

