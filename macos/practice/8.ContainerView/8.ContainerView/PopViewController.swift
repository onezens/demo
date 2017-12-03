//
//  PopViewController.swift
//  8.ContainerView
//
//  Created by wz on 2017/9/7.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class PopViewController: NSViewController {

    @IBOutlet weak var infoTextField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func add(_ sender: Any) {
        NotificationCenter.default.post(name:NSNotification.Name(rawValue:Constant.NotificationName.PopoverAdd.rawValue) , object: self.infoTextField.stringValue)
        self.infoTextField.stringValue = ""
        
        
    }
}
