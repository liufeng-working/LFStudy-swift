//
//  LFDockView.swift
//  Pad
//
//  Created by 刘丰 on 2017/10/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit

class LFDockView: UIView {
    
    lazy var middleView: LFMiddleView = {
        let middle = LFMiddleView()
        middle.backgroundColor = UIColor.white
        self.addSubview(middle)
        return middle
    }()
    
    lazy var bottomView: LFBottomView = {
        let bottom = LFBottomView()
        bottom.backgroundColor = UIColor.red
        self.addSubview(bottom)
        return bottom
    }()

    /// 当自己的frame改变时调用
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.middleView.frame = CGRect(x: 0, y: self.frame.height - self.middleHeight - self.bottomHeight, width: self.frame.width, height: self.middleHeight)
        self.bottomView.frame = CGRect(x: 0, y: self.frame.height - self.bottomHeight, width: self.frame.width, height: self.bottomHeight)
    }

}

extension LFDockView {
    
    fileprivate var middleHeight: CGFloat {
        return 600
    }
    
    fileprivate var bottomHeight: CGFloat {
        return UIDevice.current.isPortrait ? 70 : 210
    }
}
