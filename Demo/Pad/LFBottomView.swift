//
//  LFBottomView.swift
//  Pad
//
//  Created by 刘丰 on 2017/10/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit

class LFBottomView: UIView {
    
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
        for view in self.subviews {
            if UIDevice.current.isPortrait {
                let width = self.frame.width/3 - 10
                view.frame = CGRect(x: 10 + (width + 10)*index, y: 0, width: width, height: self.frame.height)
            }else {
                let height = self.frame.height/3 - 10
                view.frame = CGRect(x: 0, y: 10 + (height + 10)*index, width: self.frame.width, height: height)
            }
            
            index += 1
        }
    }
    
    fileprivate func addSubview() {
        for i in 0..<3 {
            let btn = UIButton(type: UIButtonType.custom)
            btn.backgroundColor = UIColor.black
            btn.setTitle("\(i)", for: UIControlState.normal)
            btn.setTitleColor(UIColor.white, for: UIControlState.normal)
            self.addSubview(btn)
        }
    }
}
