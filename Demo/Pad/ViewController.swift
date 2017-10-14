//
//  ViewController.swift
//  Pad
//
//  Created by 刘丰 on 2017/10/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var leftView: LFDockView = {
        let left = LFDockView()
        left.backgroundColor = UIColor.clear
        self.view.addSubview(left)
        return left
    }()
    
    lazy var rightView: UIView = {
        let right = UIView()
        right.backgroundColor = UIColor.orange
        self.view.addSubview(right)
        return right
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.leftView.frame = CGRect(x: 0, y: 0, width: self.dockWidth, height: self.view.frame.height)
        self.rightView.frame = CGRect(x: self.dockWidth, y: 0, width: self.view.frame.width - self.dockWidth, height: self.view.frame.height)
    }

}

extension ViewController {
    
    fileprivate var dockWidth: CGFloat {
        return UIDevice.current.isPortrait ? 210 : 70
    }
}

