//: Playground - noun: a place where people can play

import UIKit

//1.定义数组
//1.1不可变数组
let array = ["1", "2", "3", "4", "5", "6"]

//1.2可变数组
var arrayM = Array<String>()
var arrayM1 = [String]()

//2.对可变数组的基本操作
//2.1添加元素
arrayM.append("刘丰")
arrayM.append("xihaun")
arrayM.append("陈贝")

//2.2删除元素
arrayM.remove(at: 0)
arrayM

//2.3修改元素
arrayM[0] = "love"
arrayM

//2.4取出元素
arrayM[1]

//3.遍历数组
//3.1根据下标值进行遍历
for i in 0..<array.count {
    i
}

//3.2直接遍历数组的内容
for number in array {
    number
}

//3.3遍历数组的前两个
for number in array[0..<2] {
    number
}

//4.数组的合并
let resultArr = array + arrayM











