//
//  WindowController.swift
//  9.WindowController
//
//  Created by wz on 2017/9/7.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.titleVisibility = .hidden
        window?.titlebarAppearsTransparent = true
    }

}
