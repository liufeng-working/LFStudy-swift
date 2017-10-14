//
//  ViewController.swift
//  传感器
//
//  Created by 刘丰 on 2017/10/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    lazy var manager: CMMotionManager = {
        let manager = CMMotionManager()
        manager.accelerometerUpdateInterval = 1
        return manager
    }()
    
    lazy var setp: CMStepCounter = {
        let step = CMStepCounter()
        return step
    }()
    
    lazy var pedometer: CMPedometer = {
        let ped = CMPedometer()
        return ped
    }()
    
    lazy var view1: UIView = {
        let v = UIView(frame: CGRect(x: 90, y: 30, width: 30, height: 30))
        v.backgroundColor = UIColor.red
        self.view.addSubview(v)
        return v
    }()
    
    lazy var view2: UIView = {
        let v = UIView(frame: CGRect(x: 100, y: 150, width: 30, height: 30))
        v.backgroundColor = UIColor.blue
        self.view.addSubview(v)
        return v
    }()
    
    lazy var animator: UIDynamicAnimator = {
        let a = UIDynamicAnimator(referenceView: self.view)
        return a
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //距离传感器
        self.proximity()
        self.accelerometer()
        self.steps()
        self.dynamic()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        print(self.manager.accelerometerData!)
        
        let str = "prefs:root=General&path=About"
//        let str = UIApplicationOpenSettingsURLString
        
        let url = URL(string: str)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:]) { (ok) in
                print(ok)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("摇一摇开始")
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("摇一摇结束")
    }
    
    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("摇一摇取消")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ViewController {
    
    //距离传感器
    fileprivate func proximity() {
        UIDevice.current.isProximityMonitoringEnabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(statusChange), name: NSNotification.Name.UIDeviceProximityStateDidChange, object: nil)
    }
    
    //加速计
    fileprivate func accelerometer() {
        if !self.manager.isAccelerometerAvailable {
            print("加速计不可用")
            return
        }
        
        self.manager.startAccelerometerUpdates()
        self.manager.startAccelerometerUpdates(to: OperationQueue.main) { (data: CMAccelerometerData?, error: Error?) in
            if error == nil && data != nil {
//                print(data!)
            }
        }
    }
    
    //计步器1
    fileprivate func steps() {
        self.setp.queryStepCountStarting(from: Date(timeIntervalSinceNow: 24*60*60), to: Date(), to: OperationQueue.main) { (count: Int, error: Error?) in
            print("走了\(count)步")
        }
        
        self.setp.startStepCountingUpdates(to: OperationQueue.main, updateOn: 1) { (count: Int, _, _) in
            print("又走了\(count)步")
        }
    }
    
    //计步器2
    fileprivate func pedo() {
        if !CMPedometer.isStepCountingAvailable() {
            print("计步器不可用")
            return
        }
        
        pedometer.startUpdates(from: Date()) { (pedometerData: CMPedometerData?, _) in
            if let page = pedometerData?.currentPace {
                print("又走了\(page.intValue)步")
            }
            
        }
    }
    
    //物理仿真器
    fileprivate func dynamic() {
        self.gravity()
        self.collision()
        self.snap()
        self.push()
    }
}

extension ViewController {
    
    @objc fileprivate func statusChange(noti: Notification) {
        if UIDevice.current.proximityState {
            print("有帅哥靠近")
        }else {
            print("帅哥离开了")
        }
    }
}

//MARK: - 物理仿真行为
extension ViewController {
    
    /// 重力
    fileprivate func gravity() {
        let behavior = UIGravityBehavior(items: [self.view1])
        behavior.gravityDirection = CGVector(dx: 0, dy: 5)
        behavior.angle = CGFloat.pi/2
        self.animator.addBehavior(behavior)

    }
    
    /// 碰撞
    fileprivate func collision() {
        let behavior =  UICollisionBehavior(items: [self.view1, self.view2])
        behavior.translatesReferenceBoundsIntoBoundary = true
        behavior.collisionMode = UICollisionBehaviorMode.everything
        self.animator.addBehavior(behavior)
    }
    
    /// 捕捉
    fileprivate func snap() {
        let behavior =  UISnapBehavior(item: self.view1, snapTo: CGPoint(x: 100, y: 220))
        self.animator.addBehavior(behavior)
    }
    
    /// 推动
    fileprivate func push() {
        let behavior =  UIPushBehavior(items: [self.view1], mode: UIPushBehaviorMode.continuous)
        behavior.pushDirection = CGVector(dx: 0, dy: 100)
        self.animator.addBehavior(behavior)
    }
}

