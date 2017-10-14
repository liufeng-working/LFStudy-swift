//
//  AppDelegate.swift
//  Notification
//
//  Created by 刘丰 on 2017/10/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .badge, .sound, .carPlay], completionHandler: { (isOK: Bool, error: Error?) in
                print(isOK)
            })
            
        }else if #available(iOS 8.0, *) {
            let category: Set<UIUserNotificationCategory> = []
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: category)
            UIApplication.shared.registerUserNotificationSettings(setting)
            
        }else {
            UIApplication.shared.registerForRemoteNotifications(matching: [.alert, .badge, .sound])
        }

        return true
    }
    
}


