//
//  DrawView.swift
//  16.NSView
//
//  Created by wz on 2017/9/13.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class DrawView: NSView {
    
    
    var innerFrame: NSRect!
    var roundPath: NSBezierPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let click = NSClickGestureRecognizer(target: self, action: #selector(DrawView.click(sender:)))
        addGestureRecognizer(click)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        //fill all view
        NSColor.cyan.set()
        NSBezierPath.fill(dirtyRect)
        
        NSColor.green.set()
        let path = NSBezierPath()
        path.move(to: NSZeroPoint)
        path.line(to: NSPoint(x: bounds.width, y: bounds.height))
        path.stroke()
        
        NSColor.orange.set()
        let innerFrame = bounds.insetBy(dx: 50, dy: 50)
        let roundPath = NSBezierPath(roundedRect: innerFrame, xRadius: 4.0, yRadius: 4.0)
        roundPath.fill()
        
        self.innerFrame = innerFrame
        self.roundPath = roundPath
        
    }
    
    @objc func click(sender: NSClickGestureRecognizer) {
        
        if let innerFrame = innerFrame, innerFrame.contains(sender.location(in: self)) {
            Swift.print("inner frame")
        }
        
        if let roundPath = roundPath, roundPath.contains(sender.location(in: self)) {
            Swift.print("round path")
        }
        
    }
    
}
