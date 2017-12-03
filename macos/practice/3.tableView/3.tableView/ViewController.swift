//
//  ViewController.swift
//  3.tableView
//
//  Created by leaf on 2017/8/20.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController , NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate{
    
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    
    var fruit = ["apple", "watermelon", "banana", "orange"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func addFruit(_ sender: Any?) {
        
        let newFruit = textField.stringValue
        fruit.append(newFruit)
        textField.stringValue = ""
        tableView.reloadData()
    }
    

    // MARK: tableView datasource
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return fruit.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return fruit[row]
    }
    
    // MARK: tableview delegate
    
    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        addFruit(nil)
        return true
    }
    
}

