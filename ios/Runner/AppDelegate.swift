import UIKit
import Flutter
import Foundation

@main
@objc class AppDelegate: FlutterAppDelegate {
    static let tag = "AppDelegate"
    
    override func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                    
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
        API_OS().onTest_objc()
        
        GeneratedPluginRegistrant.register(with: self)
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

}
