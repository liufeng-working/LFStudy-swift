//: Playground - noun: a place where people can play

import UIKit

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init?(fullName: String) {
        return nil
    }
    
    func fullName() -> String {
        return self.firstName + " " + self.lastName
    }
}

let person1 = Person(firstName: "liu", lastName: "feng")
person1.fullName()

person1.firstName = "chen"
person1.lastName = "bei"
person1.fullName()

//计算属性
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

class Rectangle {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {//getter
            let centerX = self.origin.x + self.size.width/2
            let centerY = self.origin.y + self.size.height/2
            return Point(x: centerX, y: centerY)
        }
        
        set {//setter
            self.origin.x = newValue.x - self.size.width/2
            self.origin.y = newValue.y - self.size.height/2
        }
    }
    
    var area: Double {
        return self.size.width*self.size.height
    }
    
    static var name: String {
        return "图形"
    }
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
}

var rect = Rectangle(origin: Point(), size: Size(width: 10, height: 5))
rect.center
rect.center = Point()
rect.area

Rectangle.name

//属性观察器
class LightBuld {
    static let max = 30
    var current = 0 {
        willSet {
            
        }
        
        didSet {
            print(self.current)
        }
    }
    
    
}

let blub = LightBuld()
blub.current = 10
blub.current = 20
blub.current = 30
blub.current = 40

//懒加载
class Close {
    let start: Int
    let end: Int
    lazy var sum: Int = {
        var result = 0
        for i in self.start...self.end {
            result += i
        }
        return result
    }()
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
}

Close(start: 1, end: 100).sum

//单例模式
let manager = GameManager.defaultManager
manager.addScore()

