//
//  ViewController.swift
//  RXSwift体验
//
//  Created by 刘丰 on 2017/12/10.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var btn1: UIButton!
    @IBOutlet private weak var btn2: UIButton!
    @IBOutlet private weak var tf1: UITextField!
    @IBOutlet private weak var tf2: UITextField!
    
    private lazy var bag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let b = UIButton()
        self.btn1.rx.tap.subscribe { (event) in
            print("按钮1点击了")
        }.disposed(by: bag)   
        
//        let tf = UITextField()
        self.tf1.rx.text.subscribe { (event) in
            print(event.element!!)
        }.disposed(by: bag)
        
        _ = """
            123
            456
            789
            """
    }
}

