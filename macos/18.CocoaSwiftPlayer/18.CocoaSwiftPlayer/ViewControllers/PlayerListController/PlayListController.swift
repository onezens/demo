
//
//  PlayListController.swift
//  18.CocoaSwiftPlayer
//
//  Created by wz on 2017/9/16.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class PlayListController: NSViewController {

    var playLists: [PlayList] = []
    
    @IBOutlet weak var outlineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
//        outlineView.delegate = self
        outlineView.dataSource = self
        
    }
    
    @IBAction func addPlayList(_ sender: Any) {
        playLists.append(PlayList())
        outlineView.reloadData()
    }

    func isHeader(item: AnyObject?) -> Bool {
        return item is String
    }
}
// MARK: outlineview datasource

extension PlayListController:  NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        
        if item == nil {
            return 1
        }else{
            return playLists.count
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        
        if isHeader(item: item as AnyObject) {
            return true
        }else{
            return false;
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if item == nil {
            return "Library"
        } else {
            return playLists[index]
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, objectValueFortableColumn: NSTableColumn?, byItem item: Any?) -> Any? {
        
        if isHeader(item: item as AnyObject) {
            return outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: nil)
        }else{
            let cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ListCell"), owner: nil) as! PlayListCell
            
            return cell
        }
    }
}

