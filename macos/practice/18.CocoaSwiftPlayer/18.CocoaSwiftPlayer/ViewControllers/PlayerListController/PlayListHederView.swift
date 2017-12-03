//
//  PlayListHederView.swift
//  18.CocoaSwiftPlayer
//
//  Created by wz on 2017/10/13.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class PlayListHederView: NSTableHeaderView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.red.cgColor
        
        let lbl = NSTextField(labelWithString: "Library")
        lbl.frame = NSRect(x: 8, y: 3, width: 50, height: 30)
        lbl.font = NSFont.systemFont(ofSize: 12)
        lbl.textColor = NSColor.systemGray
        addSubview(lbl)
    }
    
}
