//: Playground - noun: a place where people can play

import UIKit

func block(a: Int,callBack: (_ dataStr: String) -> Int) -> Int {
    
    print(callBack("liufeng"))
    return 0
}

block(a: 1) { (dataStr) -> Int in
    print(dataStr)
    return 10
}

var callBack: ((_ jsonData: String) -> ())?

print("%p")
