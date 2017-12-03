//
//  popViewController.swift
//  5.menuBar
//
//  Created by wz on 2017/8/29.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class popViewController: NSViewController {
    
    
   class func popVC() -> popViewController {
        let sb = NSStoryboard.init(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let vc = sb.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "popViewController"))
        return vc as! popViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
