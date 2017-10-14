//
//  LFMiddleView.swift
//  Pad
//
//  Created by 刘丰 on 2017/10/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit

class LFMiddleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addSubview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var index: CGFloat = 0
        let height = self.frame.height/6 - 10
        for view in self.subviews {
            view.frame = CGRect(x: 0, y: 10 + (height + 10)*index, width: self.frame.width, height: height)
            
            if view.isKind(of: UIButton.self) {
                let btn = view as! UIButton
                
                if UIDevice.current.isPortrait {
                    btn.setTitle("\(index)", for: UIControlState.normal)
                }else {
                    btn.setTitle("", for: UIControlState.normal)
                }
            }
            index += 1
        }
    }
    
    fileprivate func addSubview() {
        for i in 0..<6 {
            let btn = UIButton(type: UIButtonType.custom)
            btn.backgroundColor = UIColor.black
            btn.setTitleColor(UIColor.white, for: UIControlState.normal)
            btn.setImage(UIImage(named: "image"), for: UIControlState.normal)
            self.addSubview(btn)
        }
    }

}
