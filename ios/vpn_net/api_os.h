#import <Foundation/Foundation.h>

@interface Api_h_IOS : NSObject
- (void) _init:(NSString*)appPath;
- (void) _startVPN:(NSData*)data taskId:(uint32_t) taskId;
- (void) _stopVPN:(uint32_t)taskId;
- (void) _onEventCb:(void(^)(uint8_t*,uint32_t))handler;
- (void) sendPacket:(NSData*)data;
- (void) setSendTunPacketCb:(void(^)(uint8_t*,uint32_t))cb;
- (void) _onLog:(void(^)(uint8_t*,uint32_t))cb;
- (void) _updateStats:(uint32_t)taskId;
- (void) _destoryAll;
@end
