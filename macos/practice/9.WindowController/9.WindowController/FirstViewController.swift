//
//  FirstViewController.swift
//  9.WindowController
//
//  Created by wz on 2017/9/7.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class FirstViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        
//        dismissViewController(self.parent!)
        parent?.dismiss(sender)
        
    }
}
