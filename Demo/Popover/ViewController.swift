//
//  ViewController.swift
//  Popover
//
//  Created by 刘丰 on 2017/10/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func leftClick(_ sender: UIBarButtonItem) {
        
        let contentVC = UIViewController()
        let popoverVC = UIPopoverController(contentViewController: contentVC)
        popoverVC.present(from: sender, permittedArrowDirections: UIPopoverArrowDirection.up, animated: true)
    }
    
    @IBAction func right(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func change(_ sender: Any) {
    }
}

