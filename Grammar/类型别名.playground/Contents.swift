//: Playground - noun: a place where people can play

import UIKit

protocol WeightCalculable {
    associatedtype weightType
    var weight: weightType { get }
    
}

class iPhone7: WeightCalculable {
    typealias weightType = Double
    
    var weight: weightType {
        return 0.114
    }
}

class Ship: WeightCalculable {
    typealias weightType = Int
    let weight: weightType
    
    init(weight: weightType) {
        self.weight = weight
    }
}

extension Int {
    typealias Weight = Int
    var t: Weight {
        return self*1000
    }
    
}

let titanic = Ship(weight: 46_328.t)

//系统常用协议
struct Record: Equatable, Comparable, CustomStringConvertible {
    var wins: Int
    var losser: Int
    
    var description: String {
        return "\(self.wins) \(self.losser)"
    }
}

func ==(left: Record, right: Record) -> Bool {
    return left.wins == right.wins && left.losser == right.losser
}

func <(left: Record, right: Record) -> Bool {
    if left != right {
        return left.wins < right.wins
    }
    return left.losser > right.losser
}

let r = Record(wins: 10, losser: 20)
print(r)


