#import "api_os.h"
#include "../../cpp/api_lib.h"
//#include "api/ios/ios_api.h"
//#include "protobuf/app.pb.h"
//#include "protobuf/ios_media_convert.pb.h"
//#include "native-lib.h"
//#include "local_notification/local_notification.h"
//#include "call/IosAudio.hpp"
//#include "api/ios/ios_call_uuid.h"
//#include "iOS/IOSMediaConverter.hpp"

@implementation API_OS

//typedef NSData* (^OnMakeThumbnail)(const char* data);

static auto constexpr TAG_API_IOS_H = "Api_h_IOS";

//OnInit _onInit;
//OnDebugLogIosDef _logCb;
//OnEventIosDef _eventCb;

- (void)onInit:(void (^__strong)(const char* resourcesPath))cb {
//    _onInit = cb;
//    setOnInit(_onInit);
}
- (void) onLogConsole_objc:(void(^)(const char* log))cb {
//    _logCb = [cb copy];
//    setOnLogToConsole(_logCb);
}
- (void) onEventCb_objc :(void(^)(uint8_t*,uint32_t))cb {
//    _eventCb = [cb copy];
//    setOnEvent(_eventCb);
}
- (void) onTest_objc {
    testMethod(0);
}
- (void) onStop_objc {
//    stopLib(0);
}

@end
