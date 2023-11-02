//
//  NetworkStreamHandler.swift
//  Runner
//
//  Created by Ian Lamprecht on 2023/11/02.
//

import Foundation
import Flutter
import Network

class NetworkStreamHandler : NSObject, FlutterStreamHandler {
    private var eventSink: FlutterEventSink? = nil
    var timer = Timer()
    let count = 1...1000
    let monitor = NWPathMonitor()
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        eventSink?("Waiting for change")
        var status = monitor.currentPath.status
        if status == .satisfied {
            self.eventSink?("Connected")
        } else {
            self.eventSink?("Not connected")
        }
        
        monitor.pathUpdateHandler = {
            path in
            if path.status == .satisfied {
                self.eventSink?("Connected")
            } else {
                self.eventSink?("Not connected")
            }
            print(path.status)
        }
        return nil
        
    }
      
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
        
    }
    
}
