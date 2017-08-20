//
//  ViewController.swift
//  2.collectionView
//
//  Created by leaf on 2017/8/20.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController , NSCollectionViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: collection datasource
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "LblCollectionViewItem", for: indexPath)
        
        return item
    }

}

