//
//  MainWindowController.swift
//  18.CocoaSwiftPlayer
//
//  Created by wz on 2017/9/16.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.titleVisibility = .hidden
        window?.titlebarAppearsTransparent = true
        
    }

}
