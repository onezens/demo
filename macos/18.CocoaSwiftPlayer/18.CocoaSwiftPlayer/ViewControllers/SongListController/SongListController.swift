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
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SongListController.playListChanged(noti:)), name: NSNotification.Name(rawValue: Constant.NotificationName.SelectPlayList), object: nil)
        
        tableView.delegate = self
    }
    
    @objc func playListChanged(noti: NSNotification) {
        
        guard let list = noti.object as? PlayList else {
            return
        }
        
        self.songLists = list.songLists
        self.tableView.reloadData()
        
    }
    
}


extension SongListController: NSTableViewDelegate {
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        let song = songLists[tableView.selectedRow]
        print(song.name)
    }
}
