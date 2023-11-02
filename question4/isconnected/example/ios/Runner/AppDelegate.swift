import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private let eventChannel = "eventChannel"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
      GeneratedPluginRegistrant.register(with: self)
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      FlutterEventChannel(name: eventChannel, binaryMessenger: controller.binaryMessenger).setStreamHandler(NetworkStreamHandler())
    
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
