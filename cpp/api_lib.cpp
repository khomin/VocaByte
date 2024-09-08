#include "api_lib.h"
#include <queue>
#include <thread>
#include "dart_api.h"
#include "protobuf/proto.pb.h"
#include "ThirdParty/loguru/loguru.hpp"
#include "db/misc_db.h"
#include "ThirdParty/thread-pool/include/BS_thread_pool.hpp"

OnEventCbTypedef eventCb;
OnDebugLogCallTypeDef logCb;
BS::thread_pool* thread_pool = nullptr;
std::shared_ptr<MiscDb> db;
std::mutex threadLock;
#ifdef VPN_USE_IOS_SERVICE
OnPacketToTunDef onPacketToTun;
#endif

Dart_Port eventCbSend_port;

// notify dart through a port that the C lib has pending async callbacks
void NotifyDart(Dart_Port send_port, const Work* work) {
  const auto work_addr = reinterpret_cast<intptr_t>(work);
  Dart_CObject dart_object;
  dart_object.type = Dart_CObject_kInt64;
  dart_object.value.as_int64 = work_addr;

  const bool result = Dart_PostCObject_DL(send_port, &dart_object);
  if (!result) {
      LOG_F(INFO, "%s: %s", TAG, "Posting message to port failed");
  }
}

DART_EXPORT intptr_t initDartApiDL(void* data) {
  return Dart_InitializeApiDL(data);
}

DART_EXPORT void dartExecuteCallback(Work* work_ptr) {
  const Work work = *work_ptr;
  work();
  delete work_ptr;
}

void onDebugLogCb(Dart_Port send_port, OnDebugLogCallTypeDef p) {}
void onEventCb(Dart_Port send_port, OnEventCbTypedef cb) {
    eventCb = cb;
    eventCbSend_port = send_port;
}

void init(uint32_t taskId, uint8_t *data, uint32_t len) {
    GOOGLE_PROTOBUF_VERIFY_VERSION;
    std::lock_guard<std::mutex> lk(threadLock);
    api::InitParams initParams;
    initParams.ParseFromArray(data, (int) len);
    if(thread_pool == nullptr) {
        thread_pool = new BS::thread_pool(5);
    }
    db = std::make_shared<MiscDb>();
    db->init(initParams.local_dir());
}

void stop(uint32_t taskId) {
    if(thread_pool != nullptr) {
        thread_pool->wait_for_tasks();
        delete thread_pool;
    }
    db = nullptr;
}

void getRecentWords(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([data, len, taskId] {
        api::ReqRecentWords in;
        api::RespRecentWords out;
        in.ParseFromArray(data, len);
        // exec
        auto r = db->getRecentWords();
        for(const auto &it: r) {
            out.add_word(it.word);
        }
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void putRecentWord(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([data, len, taskId] {
        api::Word in;
        api::RespDefault out;
        in.ParseFromArray(data, len);
        // exec
        db->putRecentWord(in.value(), in.json());
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void getSearchWords(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([data, len, taskId] {
        api::ReqSearchWords in;
        api::RespSearchWords out;
        in.ParseFromArray(data, len);

        auto r = db->getWords(in.word(), in.use_like());
        for(const auto &it: r) {
            auto p = out.add_item();
            p->set_value(it.word);
            p->set_frequency(it.frequency);
            p->set_json(it.json);
            p->set_transcript(it.transcript);
        }
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void getRandomWords(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([data, len, taskId] {
        api::ReqRandWords in;
        api::RespRandWords out;
        in.ParseFromArray(data, len);

        auto r = db->getRandWords(in.count());
        for(const auto &it: r) {
            auto p = out.add_words();
            p->set_value(it.word);
            p->set_frequency(it.frequency);
            p->set_json(it.json);
            p->set_transcript(it.transcript);
        }
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void getWordInReview(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([data, len, taskId] {
        api::ReqWordInReview in;
        api::WordInReview out;
        in.ParseFromArray(data, len);
        auto r = db->getWordInReview(in.word());
        if(r != nullptr) {
            out.set_word(r->word);
            out.set_success_count(r->success_count);
            out.set_fail_count(r->fail_count);
            out.set_last_tm_success(r->last_tm_success);
            out.set_last_tm_fail(r->last_tm_fail);
            out.set_next_review_tm_ms(r->next_review_tm);
        }
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void addWordInReview(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([data, len, taskId] {
        api::ReqAddWordInReview in;
        api::RespAddWordInCurrent out;
        in.ParseFromArray(data, len);
        if(in.use_extra_fields()) {
            auto word = MiscDb::WordCurrent();
            word.word = in.word();
            word.success_count = in.success_count();
            word.fail_count = in.fail_count();
            word.last_tm_success = in.last_tm_success();
            word.last_tm_fail = in.last_tm_fail();
            word.next_review_tm = in.next_review_tm_ms();
            db->addWordInReview(word);
        } else {
            db->addWordInReview(in.word());
        }
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void removeWordInReview(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([data, len, taskId] {
        api::ReqRemoveWordFromCurrent in;
        api::RespRemoveWordFromCurrent out;
        in.ParseFromArray(data, len);
        db->removeWordInReview(in.word());
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void updateWordInReview(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([data, len, taskId] {
        api::ReqUpdateWordInCurrent in;
        api::RespUpdateWordInCurrent out;
        in.ParseFromArray(data, len);
        auto word = MiscDb::WordCurrent();
        word.word = in.word();
        word.success_count = in.success_count();
        word.fail_count = in.fail_count();
        word.last_tm_success = in.last_tm_success();
        word.last_tm_fail = in.last_tm_fail();
        word.next_review_tm = in.next_review_tm_ms();
        db->updateWordInReview(word);
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void getReviewForToday(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([taskId] {
        api::ReqReviewForToday in;
        api::RespReviewForToday out;
        auto r = db->getReviewForToday();
        auto count = 0;
        out.set_count_all(r.size());
        for(const auto & it : r) {
            auto p = out.add_first_n_word();
            p->set_word(it.word);
            p->set_success_count(it.success_count);
            p->set_fail_count(it.fail_count);
            p->set_last_tm_success(it.last_tm_success);
            p->set_last_tm_fail(it.last_tm_fail);
            p->set_next_review_tm_ms(it.next_review_tm);
            if(count++ > 5) {
                break;
            }
        }
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void searchInReviewList(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([taskId, data, len] {
        api::ReqSearchInReviewList in;
        api::RespSearchInReviewList out;
        in.ParseFromArray(data, len);
        auto r = db->getWordInReviewList(in.limit(), in.offset(), in.use_success_count());
        for(const auto & it : r) {
            auto p = out.add_word();
            p->set_word(it.word);
            p->set_success_count(it.success_count);
            p->set_fail_count(it.fail_count);
            p->set_last_tm_success(it.last_tm_success);
            p->set_last_tm_fail(it.last_tm_fail);
            p->set_next_review_tm_ms(it.next_review_tm);
        }
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void deleteProfile(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([taskId, data, len] {
        api::ReqDeleteProfile in;
        api::RespDeleteProfile out;
        in.ParseFromArray(data, len);
        db->deleteAll();
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void getSentences(uint32_t taskId, uint8_t* data, uint32_t len) {
    std::lock_guard<std::mutex> lk(threadLock);
    if (thread_pool == nullptr) return;
    thread_pool->push_task([taskId, data, len] {
        api::ReqSentences in;
        api::RespSentences out;
        in.ParseFromArray(data, len);
        auto r = db->getSentences(in.word(), in.limit(), in.offset());
        for(auto const & it: r) {
            auto p = out.add_data();
            *p = it;
        }
        // result back
        auto res = new DartResult(taskId);
        res->protoBuf = new uint8_t[out.ByteSizeLong()];
        out.SerializeToArray(res->protoBuf, (int) out.ByteSizeLong());
        res->len = (int) out.ByteSizeLong();
        DartCallResult(res, DartCallResultType::EventBus);
    });
}

void destroyAll() {
    if(thread_pool != nullptr) {
        thread_pool->purge();
        thread_pool->wait_for_tasks();
        delete thread_pool;
        thread_pool = nullptr;
    }
}

void testMethod(uint32_t taskId) {
    LOG_F(INFO, "%s: %s", TAG, "test method 🔥🔥🔥");
}

void DartCallResult(DartResult *data, DartCallResultType type) {
    auto callback = eventCb;  // Define storage duration.
    const Work work = [data, callback]() {
        callback(data);
        delete[] (uint8_t *) data->protoBuf;
        delete data;
    };
    // Copy to heap to make it outlive the function scope.
    const Work *work_ptr = new Work(work);
    switch(type) {
    case DartCallResultType::EventBus:
        NotifyDart(eventCbSend_port, work_ptr);
        break;
    }
}
