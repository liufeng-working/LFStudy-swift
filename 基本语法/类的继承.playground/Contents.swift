//: Playground - noun: a place where people can play

import UIKit

/**
 这是一个Avatar类
 
 ```
 这是一个Avatar类
 ```
 
 # 这是标题
 
 1. 1 *1* **1** _1_
 2. 2
 */
class Avatar {
    var name: String
    var lift = 100
    var isAlive = true
    var description: String {
        return "我是 Avatar \(self.name)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    func beAttacked(attack: Int) {
        self.lift -= attack
        if self.lift < 0 {
            self.isAlive = false
        }
    }
}

class User : Avatar {
    var score = 0
    var level = 0
    override var description: String {
    return "我是 User \(self.name)"
    }
    
    func getScore(score: Int) {
        self.level += 1
    }
}

let player = User(name: "liufeng")
player.name
player.lift
player.isAlive
player.score

player.beAttacked(attack: 10)
player.lift
player.description

final class Magician : User {
    var magic = 100
    override var description: String {
        return "我是 Magician \(self.name)"
    }
}

let magic = Magician(name: "chenbei")
magic.description

class Test {
    var name: String?
    var age: Int?
}

let test = Test()




