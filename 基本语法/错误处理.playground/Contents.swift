//: Playground - noun: a place where people can play

import UIKit

assert(1 > 0)
assert(1 > 0, "错误处理")

enum Err: Error {
    case noMoreMoney
    case success
}

func vend(itemName: String, money: Int) throws -> Int {
    guard money > 10 else {
        throw Err.noMoreMoney
    }
    
    return 0
}

do {
    try vend(itemName: "", money: 3)
}catch Err.noMoreMoney {
    print("error")
}

var objects: [NSObject] = [UIColor.red, CGFloat(3.14)] as! [NSObject]

//NSObject
//AnyObject
//Any

