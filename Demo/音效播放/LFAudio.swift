//
//  LFAudio.swift
//  音效播放
//
//  Created by 刘丰 on 2017/10/14.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import AudioToolbox

class LFAudio: NSObject {
    
    public static func play(name: String, completion: (() -> ())?) {
        self.play(name: name, subdirectory: "", completion: completion)
    }
    
    public static func play(name: String, subdirectory: String = "", completion: (() -> ())? = nil) {
        //获取文件的路径
        guard let pathUrl = Bundle.main.url(forResource: name, withExtension: nil, subdirectory: subdirectory) else {
        completion?()
        return
        }
    
        //获取音效文件对应的sourceID
        var sourceID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(pathUrl as CFURL, &sourceID)
    
        //根据id播放音效
        AudioServicesPlaySystemSoundWithCompletion(sourceID) {
        //根据id释放音效
        AudioServicesDisposeSystemSoundID(sourceID)
            completion?()
        }
    }
}
