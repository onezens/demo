//
//  EventMonitor.swift
//  5.menuBar
//
//  Created by wz on 2017/8/29.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class EventMonitor {
    private var monitor: Any?
    private var mask: NSEvent.EventTypeMask?
    private var handler: (NSEvent?) -> ()
    
    init(mask: NSEvent.EventTypeMask, eventHanlder: @escaping (NSEvent?) -> () ) {
        self.mask = mask
        self.handler = eventHanlder
    }
    deinit {
        stop()
    }
    
    func stop() -> Void {
        if monitor != nil {
            NSEvent.removeMonitor(self.monitor!)
            monitor = nil
        }
    }
    
    func start() -> Void {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: self.mask!, handler: handler)
    }
}
