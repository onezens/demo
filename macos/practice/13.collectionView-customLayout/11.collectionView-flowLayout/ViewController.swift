//
//  ViewController.swift
//  11.collectionView-flowLayout
//
//  Created by wz on 2017/9/8.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

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


extension ViewController: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 50
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ImageItem"), for: indexPath)
        
        return item
    }

    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        
        var identify:String = ""
        
        if kind == NSCollectionView.SupplementaryElementKind.sectionHeader {
            identify = "Header"
        }else if kind == NSCollectionView.SupplementaryElementKind.sectionFooter {
            identify = "Footer"
        }
        
        let view = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier.init(rawValue: identify), for: indexPath)
        
        return view
        
    }
}


extension ViewController: NSCollectionViewDelegate {
    
    
    
    
    
}
