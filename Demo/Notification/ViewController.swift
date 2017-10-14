//
//  ViewController.swift
//  Notification
//
//  Created by 刘丰 on 2017/10/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import UserNotifications
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func send() {
        let notification = UILocalNotification()
        notification.alertBody = "liufeng"
        notification.fireDate = Date(timeIntervalSinceNow: 3)
        UIApplication.shared.scheduleLocalNotification(notification)
        
    }
    
    @IBAction func cancel() {
        let path = Bundle.main.path(forResource: "background.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        let player = try! AVAudioPlayer(contentsOf: url)
        player.volume = 1
        player.play()
    }
    
    @IBAction func show() {
        
    }
}


