#import "api_os.h"
#include "../../cpp/CppNative/api_lib.h"

@implementation Api_h_IOS

OnEventCbTypedef _eventCb;
OnDebugLogCallTypeDef _logCb;
OnPacketToTunDef _onPacketToTunCb;

- (void) _init:(NSString*)appPath {
    init((char*)[appPath UTF8String]);
}
- (void) _startVPN:(NSData *)data taskId:(uint32_t)taskId {
    auto p = new uint8_t[data.length];
    memcpy(p, data.bytes, data.length);
    startVPN(p, (uint32_t) data.length, taskId);
}
- (void) _stopVPN:(uint32_t)taskId {
    stopVPN(taskId);
}
- (void) _onEventCb:(void(^)(uint8_t*,uint32_t))cb {
    _eventCb = [cb copy];
    onEventCb(_eventCb);
}
// packetFlow.readPackets => cb
- (void) sendPacket:(NSData*)data {
    auto p = new uint8_t[data.length];
    memcpy(p, data.bytes, data.length);
    sendPacketFromTun(p, (uint32_t)data.length);
}
// cb => packetFlow.writePackets
- (void) setSendTunPacketCb:(void(^)(uint8_t*,uint32_t))cb {
    _onPacketToTunCb = [cb copy];
    setOnPacketToTun(_onPacketToTunCb);
}
- (void) _onLog:(void(^)(uint8_t*,uint32_t))cb {
    _logCb = [cb copy];
    onDebugLogCb(_logCb);
}
- (void) _updateStats:(uint32_t)taskId {
    updateStats(taskId);
}
- (void) _destoryAll {
    destroyAll();
}

@end
