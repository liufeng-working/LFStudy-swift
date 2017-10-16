//
//  ViewController.swift
//  音效播放
//
//  Created by 刘丰 on 2017/10/14.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var audioPlayer: AVAudioPlayer = {
        let pathUrl = Bundle.main.url(forResource: "背景.mp3", withExtension: nil)!
        let audioPlayer = try! AVAudioPlayer(contentsOf: pathUrl)
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
//        self.playInBack()
        return audioPlayer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        LFAudio.playShort(name: "背景.mp3")
    }
    
    @IBAction fileprivate func play() {
        
        self.audioPlayer.play()
    }
    
    @IBAction fileprivate func pause() {
        self.audioPlayer.pause()
    }
    
    @IBAction fileprivate func stop() {
        self.audioPlayer.stop()
        self.audioPlayer.currentTime = 0
    }
    
    @IBAction fileprivate func kuaijin() {
        self.audioPlayer.currentTime += 5
    }
    
    @IBAction fileprivate func kuaitui() {
        self.audioPlayer.currentTime -= 5
    }
    
    @IBAction fileprivate func volumn(sender: UISlider) {
        self.audioPlayer.volume = sender.value
    }
    
    fileprivate func playInBack() {
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(AVAudioSessionCategoryPlayback)
        try? audioSession.setActive(true)
    }
}

extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("\(player)播放完成")
    }
}
