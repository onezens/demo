//
//  Footer.swift
//  11.collectionView-flowLayout
//
//  Created by wz on 2017/9/12.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class Footer: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        wantsLayer = true
        layer?.backgroundColor = NSColor.orange.cgColor
    }
    
}
