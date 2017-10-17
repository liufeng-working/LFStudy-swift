//
//  UIDevice+LFExtension.swift
//  Pad
//
//  Created by 刘丰 on 2017/10/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit

extension UIDevice {
    public var isPortrait: Bool {
        return UIScreen.main.bounds.width < UIScreen.main.bounds.height
    }
}
