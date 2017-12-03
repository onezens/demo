//
//  ViewController.swift
//  10.Binding
//
//  Created by wz on 2017/9/8.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @objc dynamic var users:[User] = []
    @objc dynamic var currentUser: User? = nil
    
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var subjectField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        let user = users[row]
        nameField.stringValue = user.name
        subjectField.stringValue = user.subject
        currentUser = user
        return true
    }
}


extension ViewController: NSTextFieldDelegate {
    
    
    override func controlTextDidChange(_ obj: Notification) {
        
        currentUser?.name = nameField.stringValue
        currentUser?.subject = subjectField.stringValue
        
    }
}

