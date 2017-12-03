//
//  CustomCollectionViewLayout.swift
//  11.collectionView-flowLayout
//
//  Created by wz on 2017/9/12.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class CustomCollectionViewLayout: NSCollectionViewLayout {
    
    var itemHeight: CGFloat = 50
    
    override var collectionViewContentSize: NSSize {
        
        get {
            let count = collectionView?.numberOfItems(inSection: 0)
            if  count == 0 {
                return NSZeroSize
            }
            var size = collectionView?.superview?.bounds.size
            size?.height = CGFloat(count!) * itemHeight
            return size!
        }
    }
    
    
    override func layoutAttributesForElements(in rect: NSRect) -> [NSCollectionViewLayoutAttributes] {
        
        let count = collectionView?.numberOfItems(inSection: 0) ?? 0
        
        var attris = [NSCollectionViewLayoutAttributes]()
        
        for index in 0...(count-1) {
            let attri = collectionView?.layoutAttributesForItem(at: IndexPath(item: index, section: 0))
            attris.append(attri!)
        }
        return attris
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> NSCollectionViewLayoutAttributes? {
        
        let count = collectionView?.numberOfItems(inSection: 0)
        
        if count == 0 {
            return nil
        }
        
        let width = collectionView?.bounds.size.width ?? 0
        let frame = NSRect.init(x: 0, y: itemHeight * CGFloat(indexPath.item), width: width, height: itemHeight)
        let attri = NSCollectionViewLayoutAttributes(forItemWith: indexPath)
        attri.frame = frame
        return attri
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: NSRect) -> Bool {
        return true
    }
}
