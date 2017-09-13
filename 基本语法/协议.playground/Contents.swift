//: Playground - noun: a place where people can play

import UIKit

//协议不是一种类型
protocol Pet: class {
    var name: String { get set }
    var brithPlace: String { get }
    
    init(name: String)
    
    func playWith()
    func fed(food: String) -> String
}

class Animal {
    var type: String = "mammal"
    
}

class Dog: Animal, Pet {
    var name: String = "王二狗"
    var brithPlace: String = "bengbu"
    
    required init(name: String) {
        self.name = name
        super.init()
    }
    
    func playWith() {
        
    }
    
    func fed(food: String = "bone") -> String {
        return self.name
    }
    
    func changeName(name: String) {
        self.name = name
    }
    
    
}

class Brid: Animal {
    var name: String = ""
    
    required init(name: String) {
        self.name = name
        super.init()
    }
    
}

class Parrot: Brid, Pet {
    var brithPlace: String = "bengbu"
    
    required init(name: String) {
        super.init(name: name + name)
    }
    
    func playWith() {
        
    }
    
    func fed(food: String = "bone") -> String {
        return self.name
    }
}

let myPet = Parrot(name: "二狗")
myPet.name





		