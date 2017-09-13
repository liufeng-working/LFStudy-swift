//: Playground - noun: a place where people can play

import UIKit

class Person : NSObject {
    var name: String?
    var age: Int = 0
    
    override init() {
        //构造函数中，会自动调用super的方法
        super.init()
        print("--")
    }
    
    init(name: String = "chenbei", age: Int) {
        super.init()
        self.name = name
        self.age = age
    }
    
    init(dict: [String: Any]) {
        self.name = dict["name"] as? String
        if let age = dict["age"] as? Int{
            self.age = age
        }
    }
}

let p = Person()
let p1 = Person(name: "liufeng", age: 25)
p1.name
p1.age

let p2 = Person(dict: ["name": 13, "age": 20, "height": 168])
p2.name
p2.age

