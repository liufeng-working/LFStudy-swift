//
//  LFDetectorViewController.swift
//  QRCode
//
//  Created by 刘丰 on 2017/10/16.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import CoreImage

class LFDetectorViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var contentL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func detectorQRCode(_ sender: Any) {
        
        let result = LFQRCodeDetector.detector(image: self.imageView.image!)
        self.contentL.text = result.strings?.description
        self.imageView.image = LFQRCodeDetector.drawFrames(image: self.imageView.image!, qrFeatures: result.qrFeatures!)
    }
    
    private func drawFrame(image: UIImage, feature: CIQRCodeFeature) -> UIImage {
        let scale = image.scale
        UIGraphicsBeginImageContext(image.size)
        image.draw(at: CGPoint.zero)
        
        let context = UIGraphicsGetCurrentContext()
        context?.scaleBy(x: 1, y: -1)
        context?.translateBy(x: 0, y: -image.size.height)
        
        let bounds = feature.bounds
        let path = UIBezierPath(rect: CGRect(x: bounds.minX/scale, y: bounds.minY/scale, width: bounds.width/scale, height: bounds.height/scale))
        path.lineWidth = 5
        UIColor.red.set()
        path.stroke()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}
