//
//  ShiftClickGestureRecognizer.swift
//  15.EventHanding
//
//  Created by wz on 2017/9/13.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ShiftClickGestureRecognizer: NSClickGestureRecognizer {
    
    override func mouseDown(with event: NSEvent) {
        if event.modifierFlags.rawValue & NSEvent.ModifierFlags.shift.rawValue == NSEvent.ModifierFlags.shift.rawValue {
            super.mouseDown(with: event)
        }
    }
}
