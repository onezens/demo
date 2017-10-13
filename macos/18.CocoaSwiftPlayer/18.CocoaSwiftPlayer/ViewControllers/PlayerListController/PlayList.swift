//
//  PlayList.swift
//  18.CocoaSwiftPlayer
//
//  Created by wz on 2017/9/30.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class PlayList: NSObject {
    
    var name = "PlayList"
    var count:Int {
        return songLists.count
    }
    @objc dynamic var songLists = [Song]()
    
}
