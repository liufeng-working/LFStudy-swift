//: Playground - noun: a place where people can play

import UIKit

//面向对象的基础是类

class Person : NSObject {
    var age: Int = 0
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
}

let p = Person()
p.age = 20
p.setValue(30, forKey: "age")
p.age

class Student : NSObject {
    
    //类属性
    static var courseCount: Int = 0
    
    //存储属性
    var age: Int = 0
    var name: String? {
        willSet {
            
        }
        
        didSet {
            print(self.name!)
        }
    }
    
    var mathScore: Double = 0.0
    var chineseScore: Double = 0.0
    
    //定义一个计算属性，通过别的方式计算得到结果的属性
    var averageScore: Double {
        return (self.mathScore + self.chineseScore)*0.5
    }
    
    //定义一个方法，可以返回平均成绩
    func getAvg() -> Double {
        return (self.mathScore + self.chineseScore)*0.5
    }
    
}

Student.courseCount = 2
let s = Student()
s.age = 10
s.name = "liufeng"
s.mathScore = 78
s.chineseScore = 59.9

if let name = s.name {
    print(name)
}

let average = (s.mathScore + s.chineseScore)*0.5

s.getAvg()

s.averageScore
