import UIKit
import Flutter
import Foundation
import NetworkExtension

import SwiftProtobuf

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var currentManager: NETunnelProviderManager?
    private var channelCmd: FlutterMethodChannel?
    private var channelEvent: FlutterMethodChannel?
    private var startTimeout: Date?
    private var startLock = NSLock()
    private var isStarted = false
    private let eventCbMethod = "eventCbRaw";
    static let tag = "AppDelegate"
    
    override func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                    
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
        channelCmd = FlutterMethodChannel(name: "dev/channelCmd", binaryMessenger: controller.binaryMessenger);
        channelEvent = FlutterMethodChannel(name: "dev/channelEvent", binaryMessenger: controller.binaryMessenger)
        
        channelCmd?.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            let mt = "methodCallHandler"
            if let args = call.arguments as? Dictionary<String, Any>,
               let data = args["data"] as? FlutterStandardTypedData {
                do {
                    let ev = try ApiProto_VpnReqMsg.init(contiguousBytes: data.data)
                    switch (ev.type) {
                    case ApiProto_VpnReqMsgType.echoReq:
                        NSLog("\(AppDelegate.tag): \(mt): test message")
                    break
                    case ApiProto_VpnReqMsgType.startVpn:
                        self?.currentManager?.loadFromPreferences(completionHandler: { (error) in
                            if error == nil {
                                let session = self?.currentManager?.connection as! NETunnelProviderSession
                                do {
                                    try session.startVPNTunnel(options: [
                                        "data": ev.textFormatString()
                                    ] as [String : NSObject])
                                    self?.startTimeout = Date()
                                    self?.isStarted = true
                                    self?.sendCmd(data: Data())
                                } catch let e {
                                    NSLog("\(AppDelegate.tag): \(mt) error starting tunnel: \(e)")
                                }
                            } else {
                                NSLog("\(AppDelegate.tag): \(mt) error tunnel null")
                            }
                        })
                    case ApiProto_VpnReqMsgType.stopVpn:
                        let session = self?.currentManager?.connection as! NETunnelProviderSession
                        NEVPNManager.shared().isEnabled = false
                        session.stopVPNTunnel()
                        self?.isStarted = false
                        // send 'closed' event status to flutter
                        var ev = ApiProto_EventData()
                        ev.evID = ApiProto_EventID.eventStateChange
                        ev.stateChanged = ApiProto_EventStateChange()
                        ev.stateChanged.mNewState = ApiProto_IMainClientState.closed
                        ev.stateChanged.mOldState = ApiProto_IMainClientState.closed
                        self?.channelEvent?.invokeMethod(self!.eventCbMethod, arguments: self?.eventDataToData(ev: ev))
                        break
                    default:
                        self?.sendCmd(data: data.data)
                    }
                } catch {
                    NSLog("\(AppDelegate.tag): \(mt): error")
                }
            }
            result(true)
        })
        GeneratedPluginRegistrant.register(with: self)
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        let g1 = self.startLock.try()
        if(!g1) { return }
        reloadCurrentManager { _ in
            let mt = "applicationDidBecActive"
            self.configureVPN(completionHandler: { error in
                if let error = error {
                    NSLog("\(AppDelegate.tag): \(mt): configure error: \(error)")
                }
                self.startLock.unlock()
                
                guard let session = self.currentManager?.connection as? NETunnelProviderSession else {
                    NSLog("\(AppDelegate.tag): \(mt): empty session")
                    return
                }
                if (session.status != NEVPNStatus.disconnected) {
                    self.isStarted = true
                    self.startTimeout = Date()
                }
            })
        }
    }
    
    override func applicationWillTerminate(_ application: UIApplication) {}
    
    func configureVPN(completionHandler: @escaping (Error?) -> Void) {
        let mt = "configureVPN"
        reloadCurrentManager { (error) in
            if let error = error {
                NSLog("\(AppDelegate.tag): \(mt): error reloading preferences: \(error)")
                completionHandler(error)
                return
            }
            let manager = self.currentManager!
            manager.isEnabled = true
            
            manager.saveToPreferences { (error) in
                if let error = error {
                    NSLog("\(AppDelegate.tag): \(mt): error saving preferences: \(error)")
                    completionHandler(error)
                    return
                }
                NSLog("\(AppDelegate.tag): \(mt): saved preferences")
                self.reloadCurrentManager(completionHandler)
            }
        }
    }
    
    func reloadCurrentManager(_ completionHandler: ((Error?) -> Void)?) {
        NETunnelProviderManager.loadAllFromPreferences { (managers, error) in
            if let error = error {
                completionHandler?(error)
                return
            }
            var manager: NETunnelProviderManager?
            for m in managers! {
                manager = m
                break
            }
            if (manager == nil) {
                manager = self.makeManager()
            }
            self.currentManager = manager
            completionHandler?(nil)
        }
    }
    
    private func makeManager() -> NETunnelProviderManager {
        let manager = NETunnelProviderManager()
        manager.localizedDescription = "VocaByte"
        let proto = NETunnelProviderProtocol()
        proto.providerBundleIdentifier = "org.VocaByte.tunnel"
        proto.serverAddress = "0.0.0.0"
        proto.username = "user"
        manager.protocolConfiguration = proto
        // Enable the manager bu default.
        manager.isEnabled = true        
        return manager
    }
    
    private func sendCmd(data: Data) {
        let mt = "sendCmd"
        guard let session = self.currentManager?.connection as? NETunnelProviderSession else {
            NSLog("\(AppDelegate.tag): \(mt): empty session")
            return
        }
        if(!isStarted) {
            //NSLog("\(AppDelegate.tag): \(mt): not started")
            return
        }
        let timeout = self.startTimeout
        if(timeout == nil) {
            NSLog("\(AppDelegate.tag): \(mt): timeout is empty")
            return
        }
        let tm2 = Date().timeIntervalSince(timeout!)
        if (tm2 > 3.0 && session.status == NEVPNStatus.disconnected) {
            var ev = ApiProto_EventData()
            // send 'closed' state
            ev.evID = ApiProto_EventID.eventStateChange
            ev.stateChanged = ApiProto_EventStateChange()
            ev.stateChanged.mNewState = ApiProto_IMainClientState.closed;
            ev.stateChanged.mOldState = ApiProto_IMainClientState.closed;
            channelEvent?.invokeMethod(eventCbMethod, arguments: eventDataToData(ev: ev))
            // send error that heper is off
            ev = ApiProto_EventData()
            ev.evID = ApiProto_EventID.eventAdditionError
            ev.additionError = ApiProto_AdditionErrMsg()
            ev.additionError.err = ApiProto_VpnErrType.helperConnectionLost
            channelEvent?.invokeMethod(eventCbMethod, arguments: eventDataToData(ev: ev))
            isStarted = false
            startTimeout = nil
            NSLog("\(AppDelegate.tag): \(mt): failed to send a message")
            return
        }
        do {
            try session.sendProviderMessage(data) { response in
                if response != nil {
                    self.channelEvent?.invokeMethod(self.eventCbMethod, arguments: response)
                }
                //NSLog("\(AppDelegate.tag): \(mt) got response")
            }
        } catch {
            NSLog("\(AppDelegate.tag): \(mt) failed to send a message to the provider")
        }
    }
    
    private func eventDataToData(ev: ApiProto_EventData) -> Data? {
        let mt = "eventDataToData"
        var out = ApiProto_EventsOfPacketTunnelProvider()
        do {
            var res = ApiProto_CallResStructProto()
            var evBytes = try ev.serializedData()
            for it in evBytes {
                res.protoBuf.append(UInt32(it))
            }
            res.taskID = UInt32(ApiProto_ServiceTypes.taskIDOfEvent.rawValue)
            res.len = 0
            out.data.append(res)
            var data = try out.serializedData()
            return data
        } catch {
            NSLog("\(AppDelegate.tag): \(mt) failed eventDataToData")
        }
        return nil
    }
}
