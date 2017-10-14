//
//  ViewController.swift
//  Split
//
//  Created by 刘丰 on 2017/10/14.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let splitVC = UISplitViewController()
        splitVC.viewControllers = [UINavigationController(rootViewController: UIViewController()), UIViewController()]
        self.show(splitVC, sender: nil)
    }


}

