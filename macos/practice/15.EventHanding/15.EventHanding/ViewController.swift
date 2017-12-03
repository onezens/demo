//
//  ViewController.swift
//  15.EventHanding
//
//  Created by wz on 2017/9/13.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSGestureRecognizerDelegate {

    @IBOutlet weak var eventStatusLbl: NSTextField!
    
    var click:NSClickGestureRecognizer?
    var doubleClick: NSClickGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //single click event
        let singleClick = NSClickGestureRecognizer(target: self, action: #selector(ViewController.singleClick(sender:)))
        click = singleClick
        singleClick.delegate = self
        view.addGestureRecognizer(singleClick)
        
        //double click event
        let doubleClick = NSClickGestureRecognizer(target: self, action: #selector(ViewController.doubleClick(sender:)))
        self.doubleClick = doubleClick
        doubleClick.delegate = self
        doubleClick.numberOfClicksRequired = 2
        view.addGestureRecognizer(doubleClick)
        
        //shift click event
        let shiftClick = ShiftClickGestureRecognizer(target: self, action: #selector(ViewController.shiftClick))
        view.addGestureRecognizer(shiftClick)
        
        //right click event
        let rightClick = NSClickGestureRecognizer(target: self, action: #selector(ViewController.rightClick))
        rightClick.buttonMask = 0x2
        view.addGestureRecognizer(rightClick)
        
        //pan gesture
        let panGes = NSPanGestureRecognizer(target: self, action: #selector(ViewController.panGesture(sender:)))
        
        view.addGestureRecognizer(panGes)
    }
    
    override func viewDidAppear() {
        view.window?.makeFirstResponder(self)
        
    }
    
    // MARK: gesture event
    
    @objc func singleClick(sender: Any) {
        eventStatusLbl.stringValue = "single click"
        print("single click event")
    }
    
    @objc func doubleClick(sender: Any) {
        eventStatusLbl.stringValue = "double click"
        print("double click event")
    }
    
    @objc func shiftClick() {
        eventStatusLbl.stringValue = "shiftClick"
        print("shift click")
    }
    
    @objc func rightClick() {
        eventStatusLbl.stringValue = "right click"
        print("right click")
    }
    
    @objc func panGesture(sender: NSPanGestureRecognizer) {
        eventStatusLbl.stringValue = "pan gesture"
        print("pan gesture")
        var startPoint = NSZeroPoint
        var currentPoint = NSZeroPoint
        switch sender.state {
        case .began:
            startPoint = sender.location(in: view)
        case .changed:
            currentPoint = sender.location(in: view)
        case .ended:
            eventStatusLbl.stringValue = "pan end"
        default: break
            
        }
        print("startPoint: \(startPoint)   currentPoint: \(currentPoint)")
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: NSGestureRecognizer) -> Bool {
        
        if gestureRecognizer == click && otherGestureRecognizer == doubleClick {
            return true
        }
        
        return false
    }
    
    
    
    // MARK: key event
    
    override func keyDown(with event: NSEvent) {
        eventStatusLbl.stringValue = "no special event"
        if event.modifierFlags.rawValue & NSEvent.ModifierFlags.deviceIndependentFlagsMask.rawValue == NSEvent.ModifierFlags.shift.rawValue {
            if event.keyCode == 49 {
                eventStatusLbl.stringValue = "keyDown: shift + space"
            }
        }else if event.keyCode == 49 {
            eventStatusLbl.stringValue = "keyDown: space"
        }
    }
    
    // MARK: mouse event
    
    override func mouseDown(with event: NSEvent) {
        eventStatusLbl.stringValue = "mouse down"
    }
    
    override func mouseUp(with event: NSEvent) {
        eventStatusLbl.stringValue = "mouse up"
    }
    
    override func mouseDragged(with event: NSEvent) {
        eventStatusLbl.stringValue = "mouse dragged"
    }
    
    override func rightMouseDown(with event: NSEvent) {
        eventStatusLbl.stringValue = "right mouse down"
        
    }

}

