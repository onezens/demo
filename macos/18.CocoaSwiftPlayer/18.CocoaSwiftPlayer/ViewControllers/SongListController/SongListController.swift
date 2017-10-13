//
//  SongListController.swift
//  18.CocoaSwiftPlayer
//
//  Created by wz on 2017/9/16.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class SongListController: NSViewController {
    
    //bind to array must be @objc
    @objc dynamic var songLists = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        songLists.append(Song())
        songLists.append(Song())
        songLists.append(Song())
        songLists.append(Song())
    }
    
}
