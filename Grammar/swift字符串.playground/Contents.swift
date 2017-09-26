//: Playground - noun: a place where people can play

import UIKit

//1.定义字符串
let opration = "hello world"

//2.遍历字符串
for c in opration.characters {
    c
}

//3.字符串的拼接
//3.1两个字符串之间的拼接
let str1 = "刘丰"
let str2 = "陈贝"

let str3 = str1 + str2

//3.2字符串和其他标志符之间的拼接
let name = "刘丰"
let age = 18
let height = 177

let info = "名字是\(name)，年龄是\(age)，身高是\(height)"

//3.3拼接字符串时，字符串的格式化
let min = 2
let second = 8

let time = "\(min):\(second)"

//4.字符串的截取
let urlStr = "www.baidu.com"
//4.1将String转化成NSString
let header = (urlStr as NSString).substring(to: 3)
let middle = (urlStr as NSString).substring(with: NSMakeRange(4, 5))
let footer = (urlStr as NSString).substring(from: 10)

let str4 = String("liufeng")
let str5 = ""
let str6 = String()

str4!.isEmpty
str6.isEmpty

let coolGuy = "\u{1f60e}"
coolGuy.characters.count







