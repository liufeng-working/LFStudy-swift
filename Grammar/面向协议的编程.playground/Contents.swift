//: Playground - noun: a place where people can play

import UIKit

protocol Record: CustomStringConvertible {
    var wins: Int { get }
    var losser: Int{ get }
    
    func winningPercent() -> Double
}

//对协议进行扩展
extension Record {
    var description: String {
        return String(format: "wins: %d, losser: %d", self.wins, self.losser)
    }
    
    var gameCount: Int {
        return self.wins + self.losser
    }
    
    func showWins() {
        print("we win \(self.wins) times!!!")
    }
    
    func winningPercent() -> Double {
        return Double(self.wins)/Double(self.gameCount)
    }
}

protocol Tieable {
    var ties: Int { get set }
}

extension Record where Self: Tieable {
    var description: String {
        return String(format: "wins: %d, losser: %d, ties: %d", self.wins, self.losser, self.ties)
    }
    
    var gameCount: Int {
        return self.wins + self.losser + self.ties
    }
    
    func winningPercent() -> Double {
        return Double(self.wins)/Double(self.wins + self.losser + self.ties)
    }
}

protocol Prizable {
    func isPrizable() -> Bool
}

struct BasketballRecord: Record, Prizable {
    var wins: Int
    var losser: Int
    
    func isPrizable() -> Bool {
        return self.wins > 1
    }
}

struct BaseballRecord: Record, Prizable {
    var wins: Int
    var losser: Int
    let gameCount: Int = 162
    
    func isPrizable() -> Bool {
        return self.wins > 2
    }
}

struct FootBallRecode: Record, Tieable, Prizable {
    var wins: Int
    var losser: Int
    var ties: Int
    
    func isPrizable() -> Bool {
        return self.wins >= 1
    }
}

let basketball = BasketballRecord(wins: 1, losser: 2)
basketball.showWins()
basketball.gameCount
print(basketball)

let baseball = BaseballRecord(wins: 2, losser: 3)
baseball.gameCount

let football = FootBallRecode(wins: 1, losser: 1, ties: 1)
football.winningPercent()
print(football)

func award(one: Prizable&CustomStringConvertible) {
    if one.isPrizable() {
        print("祝贺你")
    }else {
        print("不好意思")
    }
}

award(one: football)

//面向协议的编程

























		