import Flutter
import UIKit
import Network

public class IsconnectedPlugin: NSObject, FlutterPlugin {
  let monitor = NWPathMonitor()
  let queue = DispatchQueue(label: "Monitor")

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "isconnected", binaryMessenger: registrar.messenger())
    let instance = IsconnectedPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      monitor.start(queue: queue)
      result("iOS " + UIDevice.current.systemVersion)
    case "getConnectionStatus":
      let status = monitor.currentPath.status
      var returnValue = "Not connected"
      if status == .satisfied {
           returnValue = "Connected"
      }
      result(returnValue)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
