//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Month: Int {
    case january = 1
    case february = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12
}

enum Season {
    case spring
    case summer
    case autumn
    case winter
}

let curMonth: Month = .september

func season(month: Month) -> Season {
    switch month {
    case .january, .february, .march:
        return .spring
    case .april, .may, .june:
        return .summer
    case .july, .august, .september:
        return .autumn
    case .october, .november, .december:
        return .winter
    }
}

let ss = season(month: curMonth)
print(ss)
ss.hashValue

//原始值


//相关值,可以关联多个值
enum ATMStatus {
    case success(Int)
    case error(String)
    case waiting
}

var balance = 1000
func withDraw(amount: Int) -> ATMStatus {
    if balance >= amount {
        balance -= amount
        return .success(balance)
    }else {
        return .error("余额不足")
    }
}

let result = withDraw(amount: 10000)

switch result {
case let .success(newValue):
    print("余额为\(newValue)")
case let .error(err):
    print(err)
case .waiting:
    print("waiting")
}

//枚举递归
indirect enum Expresson{
    case number(Int)
    case add(Expresson, Expresson)
    case mutiplication(Expresson, Expresson)
}

let five = Expresson.number(5)
let four = Expresson.number(4)
let two = Expresson.number(2)
let sum = Expresson.add(five, four)
let procuct = Expresson.mutiplication(sum, two)

func evaluate(expression: Expresson) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .add(left, right):
        return evaluate(expression: left) + evaluate(expression: right)
    case let .mutiplication(left, right):
        return evaluate(expression: left)*evaluate(expression: right)
    }
}

let result1 = evaluate(expression: procuct)
result1












