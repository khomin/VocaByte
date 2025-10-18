#import <Foundation/Foundation.h>

@interface API_OS : NSObject
- (void) onInit:(void(^)(const char* resourcesPath)) cb;
- (void) onLogConsole_objc:(void(^)(const char* log))cb;
- (void) onEventCb_objc:(void(^)(uint8_t*,uint32_t))cb;
- (void) onTest_objc;
@end
