#import "api_os.h"
#include "../../cpp/api_lib.h"

@implementation API_OS

static auto constexpr TAG_API_IOS_H = "Api_h_IOS";

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
