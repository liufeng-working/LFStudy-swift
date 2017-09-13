//: Playground - noun: a place where people can play

import UIKit

func about() -> () {
    print("iPhone7")
}

about()

func readMessage() -> Int {
    return 5
}

readMessage()


func callPhoto(phoneNum: String) {
    print("打电话给" + phoneNum)
}

callPhoto(phoneNum: "chenbei")

func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

sum(num1: 1, num2: 2)


//函数的使用注意
//1.内部参数和外部参数
func sum1(a num1: Int, b num2: Int) -> Int {
    return num1 + num2
}

sum1(a: 1, b: 2)

//2.默认参数
func sum2(a num1: Int, b num2: Int = 3) -> Int {
    return num1 + num2
}

sum2(a: 1, b: 2)

//3.可变参数
func sum3(num: Int...) -> Int {
    var result = 0
    for a in num {
        result += a
    }
    return result
}

sum3(num: 10, 20, 30, 40)

//4.指针类型
var a = 10
var b = 20
print("\(a) + \(b)")

func swapNum(aa: inout Int, bb: inout Int) {
    let temp = aa
    aa = bb
    bb = temp
}

swapNum(aa: &a, bb: &b)
print("\(a) + \(b)")






