//
//  AppDelegate.swift
//  4.arrayController
//
//  Created by leaf on 2017/8/21.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        print(Song.className())
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

