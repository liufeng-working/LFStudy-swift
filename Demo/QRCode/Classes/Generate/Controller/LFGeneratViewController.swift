//
//  LFGeneratViewController.swift
//  QRCode
//
//  Created by 刘丰 on 2017/10/16.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import CoreImage

class LFGeneratViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        let content = self.textView.text
        DispatchQueue.global().async {
            let generate = LFQRCodeGenerate()
            generate.centerImage = UIImage(named: "erha")
            generate.targetSize = CGSize(width: 300, height: 300)
            generate.targetColor = UIColor.orange
            if let img = generate.generate(form: content!) {
                DispatchQueue.main.async(execute: {
                    self.imageView.image = img
                    print(img, img.scale)
                })
            }
        }
    }
}
