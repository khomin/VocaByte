#import "api_os.h"
//#include "api_lib.h"
//#include "api/ios/ios_api.h"
//#include "protobuf/app.pb.h"
//#include "protobuf/ios_media_convert.pb.h"
//#include "native-lib.h"
//#include "local_notification/local_notification.h"
//#include "call/IosAudio.hpp"
//#include "api/ios/ios_call_uuid.h"
//#include "iOS/IOSMediaConverter.hpp"

@implementation API_OS

typedef NSData* (^OnMakeThumbnail)(const char* data);

static auto constexpr TAG_API_IOS_H = "Api_h_IOS";

//OnInit _onInit;
//OnDebugLogIosDef _logCb;
//OnEventIosDef _eventCb;
//OnSpeakerFrameDef _onSpeakerFrame;
//OnAudioStartDef _onAudioStart;
//OnAudioStopDef _onAudioStop;
//OnAudioSpeakerLoudDef _onAudioSpeakerLoud;
//OnAudioMicMuteDef _onAudioMicMute;
//
//OnPlayRingDef _onPlayRingDef;
//OnStopRingDef _onStopRingDef;
//OnPlayToneDef _onPlayToneDef;
//OnStopToneDef _onStopToneDef;
//
//OnMakeThumbnail _onMakeThumbnail;

//- (void)onInit:(void (^__strong)(const char* resourcesPath))cb {
//    _onInit = cb;
//    setOnInit(_onInit);
//}
//- (void) onLogConsole_objc:(void(^)(const char* log))cb {
//    _logCb = [cb copy];
//    setOnLogToConsole(_logCb);
//}
//- (void) onEventCb_objc :(void(^)(uint8_t*,uint32_t))cb {
//    _eventCb = [cb copy];
//    setOnEvent(_eventCb);
//}
//- (void) onCheckState_objc {
//    CheckState();
//}
- (void) onTest_objc {
//    testMethod(0);
}
//- (void) onStop_objc {
//    stopLib(0);
//}
//
////
//// calls
//- (NSData *)getCall_objcWithUUID:(NSString *)uuid {
//    auto info = getCallUUID(uuid.UTF8String);
//    if(info != nullptr) {
//        NSData *outData = [NSMutableData dataWithLength:(info->ByteSizeLong())];
//        info->SerializeToArray((void*) outData.bytes, (int) info->ByteSizeLong());
//        delete info;
//        return outData;
//    }
//    return nullptr;
//}
//- (NSData*) getCall_objcWithLocalId:(UInt64)localId {
//   auto info = getCallLocalId(localId);
//    if(info != nullptr) {
//        NSData *outData = [NSMutableData dataWithLength:(info->ByteSizeLong())];
//        info->SerializeToArray((void*) outData.bytes, (int) info->ByteSizeLong());
//        delete info;
//        return outData;
//    }
//    return nullptr;
//}
//- (bool)endCall_objcWithUUID:(NSString *)uuidString {
//    return endCall_UUID(uuidString.UTF8String);
//}
//- (void)bindCall_objcWithUUID:(NSString *)uuidString serverId:(uint64_t)serverId {
//    bindCall_UUID_to_serverId(uuidString.UTF8String, serverId);
//}
//- (void)bindCall_objcWithUUID:(NSString *)uuidString localId:(uint64_t)localId {
//    bindCall_UUID_to_localId(uuidString.UTF8String, localId);
//}
//- (bool)answerCall_objcWithUUID:(NSString *)uuidString withVideo:(bool)withVideo {
//    return answerCall_UUID(uuidString.UTF8String, withVideo);
//}
////- (bool)answerCall_objcWithUUID:(NSString *)uuidString {
////    return false;
////}
//
////- (void) answerCall_objc:(uint64_t)callIdLocal :(bool)useVideo {
////    apiProto::AnswerCallReq in;
////    in.set_use_video(useVideo);
////    in.set_call_id(callIdLocal);
////    auto buf = new uint8_t[in.ByteSizeLong()];
////    in.SerializeToArray(buf, (int) in.ByteSizeLong());
////    auto len = (int) in.ByteSizeLong();
////    answerCall(apiProto::ServiceTypes::ignoreTaskId, buf, len);
////}
////- (void) closeCall_objc:(uint64_t) callIdLocal {
////    CloseCallWithId(callIdLocal);
////}
////- (UInt64) serverCallIdToLocal_objc:(uint64_t)callServerId {
////    auto callList = GetActiveCallsList();
////    auto isFound = std::find_if(callList.begin(), callList.end(), [&](auto i) {
////        return i->CallIdServer == callServerId;
////    });
////    if (isFound == callList.end()) {
////        DebugLog("%s: serverCallId to local, can't find call_server_id=%ld", TAG_API_IOS_H, callServerId);
////        return 0;
////    }
////    return (*isFound)->CallId;
////}
//- (NSString*) getName_objc:(uint64_t)id :(int) type {
//    auto ln = getLocalNotification();
//    if(ln != nullptr) {
//        auto ln2 = std::static_pointer_cast<LocalNotification>(ln);
//        return [NSString stringWithUTF8String:(ln2->getName(id, (DEST_TYPE) type).c_str())];
//    }
//    return @"Unknown";
//}
//
//- (void)onAudioStart_objc:(void (^__strong)(uint64_t))cb {
//    _onAudioStart = cb;
//    auto audio = (IosAudio*) getAudio();
//    audio->SetOnStart(_onAudioStart);
//}
//- (void)onAudioStop_objc:(void (^__strong)())cb {
//    _onAudioStop = cb;
//    auto audio = (IosAudio*) getAudio();
//    audio->SetOnStop(_onAudioStop);
//}
//
//- (void)onMicMute_objc:(void (^__strong)(bool))cb {
//    _onAudioMicMute = cb;
//    auto audio = (IosAudio*) getAudio();
//    audio->SetOnMicMute(_onAudioMicMute);
//}
//- (void)onSpeakerLoud_objc:(void (^__strong)(bool))cb {
//    _onAudioSpeakerLoud = cb;
//    auto audio = (IosAudio*) getAudio();
//    audio->SetOnSpeakerLoud(_onAudioSpeakerLoud);
//}
//- (void)onSpeakerFrame_objc:(void (^__strong)(uint8_t *, uint32_t)) cb {
//    auto audio = (IosAudio*) getAudio();
//    _onSpeakerFrame = cb;
//    audio->SetOnFrame([&](uint8_t * pData, uint32_t len) {
//        _onSpeakerFrame(pData, len);
//    });
//}
//- (void)putMicFrame_objc:(NSData *)frame {
//    auto audio = (IosAudio*) getAudio();
//    auto buf = new uint8_t[frame.length];
//    memcpy(buf, frame.bytes, frame.length);
//    audio->PutFrame(buf, frame.length);
//    delete[] buf;
//}
//
//- (void)onPlayRing_objc:(void (^__strong)(const char *, uint8_t)) cb {
//    auto audio = (IosAudio*) getAudio();
//    _onPlayRingDef = cb;
//    audio->SetOnPlayRing(_onPlayRingDef);
//}
//- (void)onStopRing_objc:(void (^__strong)()) cb {
//    auto audio = (IosAudio*) getAudio();
//    _onStopRingDef = cb;
//    audio->SetOnStopRing(_onStopRingDef);
//}
//- (void)onPlayTone_objc:(void (^__strong)(int)) cb {
//    auto audio = (IosAudio*) getAudio();
//    _onPlayToneDef = cb;
//    audio->SetOnPlayTone(_onPlayToneDef);
//}
//- (void)onStopTone_objc:(void (^__strong)()) cb {
//    auto audio = (IosAudio*) getAudio();
//    _onStopToneDef = cb;
//    audio->SetOnStopTone(_onStopToneDef);
//}
//
//- (void)onVisible_objc:(bool) visible {
//    OnVisibilityChanged(visible);
//}
//
//- (bool)isMainClientPaused {
//    auto pNClient = GetMainClient();
//    if (pNClient == nullptr) return false;
//    return pNClient->IsPaused();
//}
//
//- (NSData *)getIcon_objc:(uint64_t)id :(int)type {
//    ERROR_CODE code;
//    auto icon = GetIcon(id, (DEST_TYPE) type, IconSizeType::Small, code);
//    if(icon.empty()) {
//        return nullptr;
//    }
//    NSData *data = [NSData dataWithBytes:icon.data() length:(icon.size())];
//    return data;
//}
//
//- (void) onMakeThumbnail:(NSData* (^__strong)(const char* path)) cb {
//    _onMakeThumbnail = cb;
//    auto media = (IOSMediaConverter*) getMediaConverted();
//    if(media != nullptr) {
//        media->onMakeThumbnail = ([&] (auto path) {
//            auto data = _onMakeThumbnail(path.c_str());
//            // parse proto
//            ios_media_convert_proto::Thumbnail thumbProto;
//            thumbProto.ParseFromArray(data.bytes, data.length);
//            // copy back to raw structure
//            auto thumb = Thumbnail();
//            thumb.width = thumbProto.width();
//            thumb.height = thumbProto.height();
//            thumb.orientation = thumbProto.orientation();
//            thumb.thumbSmallDataHex = thumbProto.thumb_small_data_hex();
//            thumb.thumbWidth = thumbProto.thumb_width();
//            thumb.thumbHeight = thumbProto.thumb_height();
//            thumb.thumbData = std::vector<uint8_t>(thumbProto.thumb_data().size());
//            memcpy(thumb.thumbData.data(), thumbProto.thumb_data().data(), thumb.thumbData.size());
//            thumb.isThumbnail = thumbProto.is_thumbnail();
//            return thumb;
//        });
//    }
//}
//
//- (void)setSpeaker_objc:(bool)speaker {
//    setSpeaker(speaker);
//}
//
//- (void)setMute_objc:(bool)mute {
//    setMute(mute);
//}

@end
