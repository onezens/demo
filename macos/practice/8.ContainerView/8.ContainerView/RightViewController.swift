//
//  RightViewController.swift
//  8.ContainerView
//
//  Created by wz on 2017/9/7.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class RightViewController: NSViewController {

    @IBOutlet weak var infoLbl: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        NotificationCenter.default.addObserver(self, selector: #selector(RightViewController.receiveNoti(noti:)), name: NSNotification.Name(rawValue: Constant.NotificationName.PopoverAdd.rawValue), object: nil)
    }
    
    @objc func receiveNoti(noti: NSNotification) {
        
        let info = noti.object as? String
        if info?.lengthOfBytes(using: .utf8) == 0 {
            return
        }
        self.infoLbl.stringValue = info!
    }
    
}
