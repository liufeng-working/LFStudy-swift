//
//  LFScanViewController.swift
//  QRCode
//
//  Created by 刘丰 on 2017/10/16.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import AVFoundation

class LFScanViewController: UIViewController {
    
    @IBOutlet private weak var backView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet private weak var scanView: UIImageView!
    @IBOutlet private weak var bottomC: NSLayoutConstraint!
    
    private lazy var scanner: LFQRCodeScanner = {
       let scan = LFQRCodeScanner(showIn: self.view)
        scan.isDraw = true
        scan.rectOfInterest = self.backView.frame
        scan.success = {[weak self] (strings: [String], qrObjects:  [AVMetadataMachineReadableCodeObject])
            in
            self!.label.text = strings.description
        }
        return scan
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //开始扫描
        self.scanner.startScan()
        
        self.startScanAnimation()
    }
    
    fileprivate func startScanAnimation() {
        self.bottomC.constant = -2*self.backView.frame.height
        UIView.animate(withDuration: 1.5) {
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.backView.layoutIfNeeded()
        }
    }
}
