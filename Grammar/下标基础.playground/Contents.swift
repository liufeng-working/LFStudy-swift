//: Playground - noun: a place where people can play
//下标和运算符

import UIKit

struct Vector3 {
    var x: Double = 0
    var y: Double = 0
    var z: Double = 0
    
    subscript(index: Int) -> Double? {
        get {
            switch index {
            case 0: return self.x
            case 1: return self.y
            case 2: return self.z
            default: return nil
            }
        }
        
        set {
            guard let newValue = newValue else { return }
            switch index {
            case 0: self.x = newValue
            case 1: self.y = newValue
            case 2: self.z = newValue
            default: return
            }
        }
    }
    
    subscript(axis: String) -> Double? {
        switch axis {
        case "x", "X": return self.x
        case "y", "Y": return self.y
        case "z", "Z": return self.z
        default: return nil
        }
    }
}

var v = Vector3(x: 1, y: 2, z: 3)
v.x
v[1]
v["z"]

v[0] = 100
v.x



		
