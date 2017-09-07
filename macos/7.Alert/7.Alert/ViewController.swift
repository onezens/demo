//
//  ViewController.swift
//  7.Alert
//
//  Created by wz on 2017/9/7.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
//        alert()
    }
    
    @IBAction func showAlert(_ sender: Any) {
        
        alert()
    }
    
    
    func alert() {
        
        let alert = NSAlert()
        alert.messageText = "AlertMessage"
        alert.informativeText = "AlertInfomativeText"
        alert.addButton(withTitle: "btn1")
        alert.addButton(withTitle: "btn2")
        alert.addButton(withTitle: "btn3")
        
        //type1: in app show alert
        alert.beginSheetModal(for: view.window!) { (response) in
            print(response)
            
        }
        
        
        //type2: system window show alert
//        let result = alert.runModal()
//        print(result)
        
        
    }


}

