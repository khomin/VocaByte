#ifndef API_LIB_H
#define API_LIB_H

#include <stdbool.h>
#include <stdio.h>
#include <stdint.h>


#include "dart_api.h"
#include "dart_native_api.h"
#include "dart_api_dl.h"
#include <functional>

#if defined(__clang__)
#define SHARED_EXPORT __attribute__((visibility("default")))
#define SHARED_LOCAL __attribute__((visibility("default")))
#endif

#if defined(IS_BUILDING_SHARED)
#define API SHARED_EXPORT
#else
#define API
#endif

#ifdef __APPLE__
#include <TargetConditionals.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

enum DartCallResultType { EventBus };

class DartResult {
public:
    DartResult(uint32_t id) : len(0), protoBuf(NULL), taskId(id) {}
    uint32_t len;
    uint8_t* protoBuf;
    uint32_t taskId;
};
typedef void (*OnEventCbTypedef)(DartResult* data);
typedef void (*OnDebugLogCallTypeDef)(uint8_t* data, uint32_t len);

void onDebugLogCb(Dart_Port send_port, OnDebugLogCallTypeDef p);
void onEventCb(Dart_Port send_port, OnEventCbTypedef cb);
typedef std::function<void()> Work;

void init(uint32_t taskId, uint8_t *data, uint32_t len);
void stop(uint32_t taskId);

void getRecentWords(uint32_t taskId, uint8_t* data, uint32_t len);
void putRecentWord(uint32_t taskId, uint8_t* data, uint32_t len);
void getSearchWords(uint32_t taskId, uint8_t* data, uint32_t len);
void getRandomWords(uint32_t taskId, uint8_t* data, uint32_t len);

void getWordInReview(uint32_t taskId, uint8_t* data, uint32_t len);
void addWordInReview(uint32_t taskId, uint8_t* data, uint32_t len);
void removeWordInReview(uint32_t taskId, uint8_t* data, uint32_t len);
void updateWordInReview(uint32_t taskId, uint8_t* data, uint32_t len);
void getReviewForToday(uint32_t taskId, uint8_t* data, uint32_t len);
void searchInReviewList(uint32_t taskId, uint8_t* data, uint32_t len);
void deleteProfile(uint32_t taskId, uint8_t* data, uint32_t len);

void getSentences(uint32_t taskId, uint8_t* data, uint32_t len);

void destroyAll();
void testMethod(uint32_t taskId);

DART_EXPORT void dartExecuteCallback(Work* work_ptr);
DART_EXPORT intptr_t initDartApiDL(void* data);
void DartCallResult(DartResult *data, DartCallResultType type);

static const char *TAG = "Api";

#ifdef __cplusplus
} // extern "C"
#endif

#endif //API_LIB_H
