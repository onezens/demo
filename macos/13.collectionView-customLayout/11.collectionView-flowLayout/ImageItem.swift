//
//  ImageItem.swift
//  11.collectionView-flowLayout
//
//  Created by wz on 2017/9/8.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ImageItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.cyan.cgColor
    }
    
    override var isSelected: Bool {
        didSet{
            super.isSelected = isSelected
            renderSelectedColor(isSelect: isSelected)
        }
    }
    
    func renderSelectedColor(isSelect: Bool){
        if isSelected {
            view.layer?.backgroundColor = NSColor.lightGray.cgColor
        }else{
            view.layer?.backgroundColor = NSColor.cyan.cgColor
        }
    }
    
    
}
