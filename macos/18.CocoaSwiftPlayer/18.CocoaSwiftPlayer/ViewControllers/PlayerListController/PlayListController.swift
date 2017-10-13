
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
        
        let list = PlayList()
        playLists.append(list)
        list.songLists.append(Song())
        list.songLists.append(Song())
        list.songLists.append(Song())
        list.songLists.append(Song())
        playLists.append(PlayList())
        playLists.append(PlayList())
        outlineView.delegate = self
        outlineView.dataSource = self
        
        
    }
    
    func headerView() -> NSTableHeaderView {
        let headerView = NSTableHeaderView()
        headerView.layer?.backgroundColor = NSColor.red.cgColor
        return headerView
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
    
    //获取有多少个列的数目，包括子列数
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        
        if item == nil {
            return 1
        }else{
            return playLists.count
        }
    }
    
    //该列是否可以展开，即是否拥有子列
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        
        return isHeader(item: item as AnyObject)
    }
    
    //获取子列的item
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if item == nil {
            return "nil"
        } else {
            return playLists[index]
        }
    }
    
    
}

// MARK: outlineview datasource

extension PlayListController:  NSOutlineViewDelegate{
    
    //ever Column cell
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        if isHeader(item: item as AnyObject) {

            let cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "GroupCell"), owner: nil) as! PlayListGroupCell
            cell.titleField.stringValue = "like"
            return cell
           
        }else{
            let cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ListCell"), owner: nil) as! PlayListCell
            let list = item as! PlayList
            cell.nameField.stringValue = list.name
            cell.countField.stringValue = "\(list.count)"
            return cell
        }
    }
    

}

