//
//  ViewController.swift
//  远程音效播放
//
//  Created by 刘丰 on 2017/10/16.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var player: AVPlayer = {
        let url = URL(string: "http://oxwp53tuw.bkt.clouddn.com/10405520.mp3")!
        //http://oxwp53tuw.bkt.clouddn.com/255319.mp3
//        let player = AVPlayer(url: url)
        let item = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: item)
        return player
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.player.play()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let url = URL(string: "http://oxwp53tuw.bkt.clouddn.com/255319.mp3")!
        //        let player = AVPlayer(url: url)
        let item = AVPlayerItem(url: url)
        self.player.replaceCurrentItem(with: item)
    }
}

