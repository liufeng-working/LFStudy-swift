//: Playground - noun: a place where people can play

import UIKit

func swipeThings<T>(_ a: inout T, _ b: inout T) {
    (a, b) = (b, a)
}

var name1 = "name1"
var name2 = "name2"
swipeThings(&name1, &name2)
name1
name2

swipeThings(&name1, &name2)
name1
name2

//泛型类型
struct Stack<T> {
    var items = [T]()
    
    func isEmpty() -> Bool {
        return self.items.count == 0
    }
    
    mutating func push(item: T) -> T {
        self.items.append(item)
        return item
    }
    
    mutating func pop() -> T? {
        guard !self.items.isEmpty else {
            return nil
        }
        
        return self.items.removeLast()
    }
}

extension Stack {
    func top() -> T? {
        return self.items.last
    }
}

var s = Stack<Int>()
s.push(item: 1)
s.push(item: 2)
s.pop()
s.top()
s.pop()
s.top()

struct Pair<T1, T2> {
    var a1: T1
    var a2: T2
    
    init(a1: T1, a2: T2) {
        self.a1 = a1
        self.a2 = a2
    }
}

let p = Pair<String, Int>(a1: "liufeng", a2: 25)

