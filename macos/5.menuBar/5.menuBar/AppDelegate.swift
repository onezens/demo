//
//  AppDelegate.swift
//  5.menuBar
//
//  Created by wz on 2017/8/29.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusBar = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = NSMenu()
    let popover = NSPopover()
    var eventMonitor: EventMonitor?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusBar.button{
            button.image = NSImage(named: NSImage.Name(rawValue: "baricon"))
            button.action = #selector(AppDelegate.showPopView(sender:))
            //下面方法事件不能触发
            //button.action = Selector(("showPopView:"))
            
        }
        eventMonitor = EventMonitor.init(mask: [.leftMouseUp, .rightMouseUp], eventHanlder: { (event) in
            self.closePop(sender: event)
        })
        eventMonitor?.start()
        
        //item形式
//        menu.addItem(NSMenuItem.init(title: "showWeather", action: #selector(AppDelegate.showWeather), keyEquivalent: "S"))
//        menu.addItem(NSMenuItem.separator())
//        menu.addItem(NSMenuItem.init(title: "quit", action: #selector(AppDelegate.statusMenuQuit), keyEquivalent: "q"))
//        statusBar.menu = menu
        
        
        popover.contentViewController = popViewController.popVC()
    }
    
    
    @objc func showPopView(sender: NSStatusBarButton) -> Void {
        
        if popover.isShown {
            closePop(sender: sender)
        }else{
            showPop()
        }
    }
    
    
    func closePop(sender: AnyObject?) -> Void {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    func showPop() -> Void {
        if let button = statusBar.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
        eventMonitor?.start()
    }
    
    @objc func statusMenuQuit() -> Void {
        print("quit")
    }
    
    @objc func showWeather() -> Void {
        print("show weather")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

