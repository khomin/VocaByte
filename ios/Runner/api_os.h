#import <Foundation/Foundation.h>

@interface API_OS : NSObject
- (void) onInit:(void(^)(const char* resourcesPath)) cb;
- (void) onLogConsole_objc:(void(^)(const char* log))cb;
- (void) onEventCb_objc:(void(^)(uint8_t*,uint32_t))cb;

- (NSString*) getName_objc:(uint64_t) id :(int) type;

//- (void) answerCall_objc:(uint64_t) callServerId :(bool)useVideo;
//- (void) closeCall_objc:(uint64_t) callServerId;
//- (UInt64) serverCallIdToLocal_objc:(uint64_t) callServerId;
//- (void) reportCallWithUUID:(NSString*) uuid serverId:(uint64_t)serverId);
//- (void)reportCall_objcUUID:(NSString *) uuid serverId:(uint64_t)serverId;

- (NSData*) getCall_objcWithUUID:(NSString*) uuid;
- (NSData*) getCall_objcWithLocalId:(UInt64) localId;
- (void) bindCall_objcWithUUID:(NSString *)uuidString serverId:(uint64_t)serverId;
- (void) bindCall_objcWithUUID:(NSString *)uuidString localId:(uint64_t)localId;
- (bool) endCall_objcWithUUID:(NSString *)uuidString;
- (bool) answerCall_objcWithUUID:(NSString *)uuidString withVideo:(bool) withVideo;

- (void) onSpeakerLoud_objc:(void(^)(bool loud)) cb;
- (void) onMicMute_objc:(void(^)(bool mute)) cb;
- (void) setMute_objc:(bool) mute;
- (void) setSpeaker_objc:(bool) speaker;

- (void) onPlayRing_objc:(void(^)(const char* path, uint8_t)) cb;
- (void) onStopRing_objc:(void(^)(void)) cb;
- (void) onPlayTone_objc:(void(^)(int toneId)) cb;
- (void) onStopTone_objc:(void(^)()) cb;

- (void) onAudioStart_objc:(void(^)(uint64_t mode)) cb;
- (void) onAudioStop_objc:(void(^)()) cb;

- (void) putMicFrame_objc:(NSData*) frame;
- (void) onSpeakerFrame_objc:(void(^)(uint8_t*,uint32_t)) cb;

- (void) onVisible_objc:(bool) visible;

// service
- (void) onStop_objc;
- (void) onCheckState_objc;
- (bool) isMainClientPaused;
- (void) onTest_objc;

- (NSData*) getIcon_objc:(uint64_t)id :(int)type;

- (void) onMakeThumbnail:(NSData* (^__strong)(const char* path)) cb;
@end
