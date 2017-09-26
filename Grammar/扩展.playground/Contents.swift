//: Playground - noun: a place where people can play

import UIKit

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
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
}

extension Rectangle {
    func translate(x: Double, y: Double) {
        self.origin.x += x
        self.origin.y += y
    }
}

let rect = Rectangle(origin: Point(), size: Size())
rect.translate(x: 10, y: 10)
rect

extension Rectangle {
    var center: Point {
        get {
            return Point()
        }
        
        set {
            print(newValue)
        }
    }
    
   convenience init(center: Point, size: Size) {
        self.init(origin: Point(), size: Size())
    }
}

rect.center = Point(x: 20, y: 15)

extension Rectangle {
    enum Vertex: Int {
        case leftTop
        case rightTop
        case rightBottom
        case leftBottom
    }
    
    func pointAtVertex(v: Vertex) -> Point {
        switch v {
        case .leftTop:
            return self.origin
        case .rightTop:
            return self.origin
        case .rightBottom:
            return self.origin
        case .leftBottom:
            return self.origin
        }
    }
    
    subscript(index: Int) -> Point {
        assert(index >= 0 && index < 0, "越界")
        return self.pointAtVertex(v: Vertex(rawValue: index)!)
    }
}

Rectangle.Vertex.leftTop.hashValue

//扩展系统类
extension Int {
    var square: Int {
        return self*self
    }
    
    var cube: Int {
        return self*self*self
    }
}

let num = 8
num.square
num.cube



