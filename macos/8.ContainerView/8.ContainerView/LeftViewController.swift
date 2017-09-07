//
//  LeftViewController.swift
//  8.ContainerView
//
//  Created by wz on 2017/9/7.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class LeftViewController: NSViewController {

    @IBOutlet weak var popoverBtn: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func showPoper(_ sender: Any) {
        popover()
    }
    
    func popover() {
        let sb = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let vc = sb.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "popViewController")) as! NSViewController
        let popover = NSPopover()
        popover.behavior = .transient
        popover.contentViewController = vc
        popover.show(relativeTo: popoverBtn.bounds, of: popoverBtn, preferredEdge: .maxY)
    }
}
