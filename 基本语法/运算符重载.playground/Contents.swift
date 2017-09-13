//: Playground - noun: a place where people can play

import UIKit

struct Vector3 {
    var x: Double = 0.0
    var y: Double = 0.0
    var z: Double = 0.0
    
    subscript(index: Int) -> Double? {
        get {
            switch index {
            case 0: return self.x
            case 1: return self.y
            case 2: return self.z
            default : return nil
            }
        }
        
        set {
            guard let newValue = newValue else { return }
            switch index {
            case 0: self.x = newValue
            case 1: self.y = newValue
            case 2: self.z = newValue
            default : return
            }
        }
    }
    
    subscript(axis: String) -> Double? {
        switch axis {
        case "x", "X": return self.x
        case "y", "Y": return self.y
        case "z", "Z": return self.z
        default : return nil
        }
    }
}

func +(left: Vector3, right: Vector3) -> Vector3 {
    return Vector3(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
}

var v1 = Vector3(x: 1, y: 2, z: 3)
let v2 = Vector3(x: 2, y: 3, z: 4)
var v3 = Vector3(x: 3, y: 4, z: 5)

let v12 = v1 + v2

func +=(left: inout Vector3, right: Vector3) {
    left = left + right
}

v1 += v2

prefix func -(vector: Vector3) -> Vector3 {
    return Vector3(x: -vector.x, y: -vector.y, z: -vector.z)
}

-v3

func ==(left: inout Vector3, right: Vector3) -> Bool {
    return left.x == right.x && left.y == right.y && left.z == right.z
}

func !=(left: inout Vector3, right: Vector3) -> Bool {
    return !(left == right)
}

v3 != v2

postfix operator +++
postfix func +++(vector: inout Vector3) -> Vector3 {
    let ret = vector
    vector += Vector3(x: 1.0, y: 1.0, z: 1.0)
    return ret
}

v3+++

prefix operator +++
prefix func +++(vector: inout Vector3) -> Vector3 {
    vector += Vector3(x: 1.0, y: 1.0, z: 1.0)
    return vector
}

//infix operator ^
//infix func ^() {
//    
//}











