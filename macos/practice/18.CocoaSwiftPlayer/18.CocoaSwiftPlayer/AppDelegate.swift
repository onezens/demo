//
//  AppDelegate.swift
//  18.CocoaSwiftPlayer
//
//  Created by wz on 2017/9/16.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa
import RealmSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        print(PlayList.className())
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

