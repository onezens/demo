//
//  MusicPlayer.swift
//  18.CocoaSwiftPlayer
//
//  Created by wz on 2017/10/13.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import AVFoundation

class MusicPlayer: NSObject {

    static let musicPlayer = MusicPlayer()
    private var player: AVAudioPlayer?
    var volume: Float = 0.2
    private var currentUrl: String?
    
    func play(urlString: String?){
        
        
        if urlString != nil {
            if currentUrl != urlString {
                currentUrl = urlString
                if let url = URL(string: urlString!) {
                    player = try? AVAudioPlayer(contentsOf: NSURL(string: urlString!) as! URL)
                    player?.prepareToPlay()
                }
            }
            player?.play()
        }else if currentUrl != nil {
            player?.play()
        }
    }
    
    func pause(){
        player?.pause()
    }
    
    func stop(){
        player?.stop()
    }
}

extension MusicPlayer: AVAudioPlayerDelegate {
 
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
        print("audioPlayerDecodeErrorDidOccur")
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("audioPlayerDidFinishPlaying")
    }
}
