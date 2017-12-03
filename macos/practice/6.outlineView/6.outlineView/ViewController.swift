//
//  ViewController.swift
//  6.outlineView
//
//  Created by wz on 2017/8/30.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {

    @IBOutlet var treeController: NSTreeController!
    @IBOutlet weak var outlineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addData()
        
        outlineView.expandItem(nil, expandChildren: true)
        
        outlineView.deselectRow(0)
        
        outlineView.registerForDraggedTypes([NSPasteboard.PasteboardType.string])
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func addData() -> Void {
        
        let root: [String: Any] = [
            "name": "root" ,
            "isLeaf": false
        ]
        
        let dict: NSMutableDictionary = NSMutableDictionary.init(dictionary: root)
        
        let p1 = Playlist()
        p1.name = "p1"
        let p2 = Playlist()
        p2.name = "p2"
        
        dict.setObject([p1, p2], forKey: "children" as NSCopying)
        
        treeController.addObject(dict)
        
    }
    
    // MARK: helpper
    
    func isHeader(item: Any) -> Bool {
        
        if let item = item as? NSTreeNode {
            return !(item.representedObject is Playlist)
        }else{
            return !(item is Playlist)
        }
    }
    
    
    // MARK: delegate
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        if isHeader(item: item) {
            return outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self)
        }else{
            return outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self)
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        return isHeader(item: true)
    }
    
    func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool {
        return !isHeader(item: true)
    }
    
    func outlineView(_ outlineView: NSOutlineView, shouldShowOutlineCellForItem item: Any) -> Bool {
        return !isHeader(item: item)
    }
    
    
    // MARK: datasource
    
    func outlineView(_ outlineView: NSOutlineView, pasteboardWriterForItem item: Any) -> NSPasteboardWriting? {
        let pbItem = NSPasteboardItem()
        
        if let item = (item as? NSTreeNode)?.representedObject as? Playlist {
            pbItem.setString(item.name, forType: NSPasteboard.PasteboardType.string)
            print(item.name)
            return pbItem
        }
        
        return nil
    }
    
    func outlineView(_ outlineView: NSOutlineView, validateDrop info: NSDraggingInfo, proposedItem item: Any?, proposedChildIndex index: Int) -> NSDragOperation {
        
        let canDrag = index >= 0 && item != nil
        
        if canDrag {
            return .move
        } else {
            return .every
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, acceptDrop info: NSDraggingInfo, item: Any?, childIndex index: Int) -> Bool {
        
        let pb = info.draggingPasteboard()
        let name = pb.string(forType: NSPasteboard.PasteboardType.string)
        
        var sourceNode: NSTreeNode?
        
        if let item = item as? NSTreeNode, item.children != nil {
            for node in item.children! {
                if let playlist = node.representedObject as? Playlist {
                    if playlist.name == name {
                        sourceNode = node
                    }
                }
            }
        }
        if sourceNode == nil {
            return false
        }
        
        let fromIndexPath = treeController.selectionIndexPath
        
        if fromIndexPath == nil {
            return false
        }
        
        let indexArr: [Int] = [0, index]
        let toIndexPath = NSIndexPath(indexes: indexArr, length: 2)
        treeController.move(sourceNode!, to: toIndexPath as IndexPath)
        
        undoManager?.prepare(withInvocationTarget: self)
        
        self.reverse(sourceNode: sourceNode, fromIndexPath: fromIndexPath! as NSIndexPath)

        undoManager?.setActionName("Move")
        
        return true
        
    }
    
    func reverse(sourceNode: NSTreeNode?, fromIndexPath: NSIndexPath?) {
        treeController.move(sourceNode!, to: fromIndexPath! as IndexPath)
    }
    
}

