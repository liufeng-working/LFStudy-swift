//
//  ViewController.swift
//  录音
//
//  Created by 刘丰 on 2017/10/14.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    lazy var record: AVAudioRecorder? = {
        let url = URL(string: "/Users/liufeng/Desktop/record/audio.mp3")!
        let setting = [
            //编码格式
        AVFormatIDKey: NSNumber(value: Int(kAudioFormatLinearPCM)),
        //采样率
            AVSampleRateKey: NSNumber(value: 11025.0),
            //通道数
            AVNumberOfChannelsKey: NSNumber(value: 2),
            //录音质量
            AVEncoderAudioQualityKey: NSNumber(value: Int32(Int(AVAudioQuality.min.rawValue)))]
        do {
            let record = try AVAudioRecorder(url: url, settings: setting)
            record.prepareToRecord()
            return record
        }catch {
            return nil
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.record?.record()
        print("开始录音")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.record?.stop()
        print("结束录音")
    }

}

