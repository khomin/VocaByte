//
//  PacketTunnelProvider.swift
//  vpn_net
//
//  Created by khomin on 15/11/2022.
//

import NetworkExtension
import SwiftProtobuf

class PacketTunnelProvider: NEPacketTunnelProvider {
    var api = Api_h_IOS()
    var evQueue: [ApiProto_CallResStructProto] = []
    var evQuelock = NSLock()
    var settings: NEPacketTunnelNetworkSettings?
    var tag = "PacketTunnelProvider"
    
    override init() {
        super.init()
        NSLog("\(self.tag): init")
        
        api._(onLog: { (data:UnsafeMutablePointer<UInt8>?, len:UInt32) in
            if(data != nil) {
                var str = String(cString: data!)
                str = str.replacingOccurrences(of: "\n\r", with: "")
                NSLog("\(self.tag): onLog=\(str)")
            }
        })
        api._(onEventCb: { (data:UnsafeMutablePointer<UInt8>?, len:UInt32) in
            if(data == nil || len == 0) {
                return
            }
            do {
                let a = UnsafeMutableBufferPointer(start: data, count: Int(len))
                let resProto = try ApiProto_CallResStructProto(contiguousBytes: a)
                
                self.evQuelock.lock()
                self.evQueue.append(resProto)
                self.evQuelock.unlock()
                //NSLog("\(self.tag): taskId=\(resProto.taskID),len=\(resProto.len)")
                if(resProto.taskID == ApiProto_ServiceTypes.taskIDOfEvent.rawValue) {
                    var ev = Data(count: Int(resProto.len))
                    var count = 0
                    for it in resProto.protoBuf {
                        ev[count] = UInt8(it)
                        count += 1
                    }
                    let event = try ApiProto_EventData(contiguousBytes: ev)
                    
                    if(event.evID == ApiProto_EventID.eventVpnSetup) {
                        if(event.eventTunelSetup.hasVpnIp) {
                            NSLog("\(self.tag): eventVpnSetup")
                        
                            var _u8To32: [UInt8] = []
                            withUnsafeBytes(of: event.eventTunelSetup.vpnIp)  {
                                _u8To32.append(contentsOf: $0)
                            } // here eventVpnSetup = 10.64.114.1
                            let ip = String(format: "%d.%d.%d.%d", _u8To32[3], _u8To32[2], _u8To32[1], _u8To32[0])

                            let sets = NEPacketTunnelNetworkSettings(tunnelRemoteAddress: "127.0.0.1")
                            sets.ipv4Settings = NEIPv4Settings(
                                addresses: [ip],
                                subnetMasks: ["255.255.255.255"])
                            sets.dnsSettings = NEDNSSettings(servers: ["8.8.8.8"])
                            sets.dnsSettings?.matchDomains = [""]
                            sets.ipv4Settings?.includedRoutes = [
                                NEIPv4Route.default(),
                            ]
                            sets.mtu = 1400
                            self.setTunnelNetworkSettings(sets) { error in
                                NSLog("\(self.tag): Did setup tunnel settings (eventVpnProtect)")
                                self.settings = sets
                                self.handlePackets()
                            }
                        }
                    }
                }
            } catch {
                NSLog("\(self.tag): onEventCb ex")
            }
        })
        api.setSendTunPacketCb { (data:UnsafeMutablePointer<UInt8>?, len:UInt32) in
            if(data == nil) {
                return
            }
            autoreleasepool {
                let buf = Data(UnsafeBufferPointer(start: data, count: Int(len)))
                let res = self.packetFlow.writePackets([buf], withProtocols: [AF_INET as NSNumber])
                if(!res) {
                    NSLog("\(self.tag): writePackets error: \(len)")
                }
            }
        }
        
        NSLog("\(self.tag): init-app...")
        let dir = FileManager.default.temporaryDirectory
        api._init("\(dir.path)")
        NSLog("\(self.tag): init-app-done: (\(dir.path))")
    }
    
//    deinit {
//        NSLog("\(self.tag): deinit")
//        api._destoryAll()
//    }
    
    override func startTunnel(options: [String : NSObject]?, completionHandler: @escaping (Error?) -> Void) {
        let mt = "startTunnel"
        NSLog("\(self.tag): \(mt)")
        let opt = options?["data"] as! String? ?? ""
        if (!opt.isEmpty) {
            do {
                let cmd = try ApiProto_VpnReqMsg.init(textFormatString: opt)
                switch(cmd.type) {
                case .startVpn:
                    NSLog("\(self.tag): \(mt) startVPN")
                    let prot = try cmd.startVpnData.serializedData()
                    api._startVPN(prot, taskId: 0)
                    break
                default: break
                }
            } catch {
                NSLog("\(self.tag): \(mt) exception")
            }
        } else {
            NSLog("\(self.tag): \(mt) no configuration")
            cancelTunnelWithError( NSError(domain: "no-configuration", code: 0))
        }
        completionHandler(nil)
    }
    
    override func stopTunnel(with reason: NEProviderStopReason, completionHandler: @escaping () -> Void) {
        NSLog("\(self.tag): stopTunnel...")
        api._stopVPN(0)
        NSLog("\(self.tag): stopTunnel.destroy...")
        api._destoryAll()
        NSLog("\(self.tag): stopTunnel.done")
        completionHandler()
    }
    
    override func handleAppMessage(_ data: Data, completionHandler: ((Data?) -> Void)?) {
        do {
            if(data.count == 0) {
                NSLog("\(self.tag): zero len")
                return
            }
            let cmd = try ApiProto_VpnReqMsg.init(contiguousBytes: data)
            switch(cmd.type) {
            case .startVpn:
                NSLog("\(self.tag): startVPN")
                let prot = try cmd.startVpnData.serializedData()
                api._startVPN(prot, taskId: 0)
                break
            case .stopVpn:
                NSLog("\(self.tag): stopVPN")
                api._stopVPN(0)
                NSLog("\(self.tag): reset tunnel")
                self.setTunnelNetworkSettings(nil)
                break
            case .updateStats:
                api._updateStats(0)
                break
            case .getEvents:
                evQuelock.lock()
                if(!evQueue.isEmpty) {
                    var proto = ApiProto_EventsOfPacketTunnelProvider()
                    while(!evQueue.isEmpty) {
                        proto.data.append(evQueue.removeFirst())
                    }
                    try completionHandler?(proto.serializedData())
                    evQueue.removeAll()
                    self.evQuelock.unlock()
                    return
                }
                self.evQuelock.unlock()
                break
            case .echoReq: break
            }
            if(completionHandler != nil) {
                completionHandler?(nil)
            }
        } catch {
            NSLog("\(self.tag): exception")
        }
    }
    
    override func sleep(completionHandler: @escaping () -> Void) {
        // Add code here to get ready to sleep.
        NSLog("\(self.tag): sleep")
        completionHandler()
    }
    
    override func wake() {
        NSLog("\(self.tag): wake")
        // Add code here to wake up.
    }
    
    func handlePackets() {
        packetFlow.readPackets {[weak self] (packets, protocols) in
            guard let strongSelf = self else { return }
            for packet in packets {
                strongSelf.api.sendPacket(packet)
            }
            strongSelf.handlePackets()
        }
    }
}
