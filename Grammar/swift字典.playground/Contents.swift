//: Playground - noun: a place where people can play

import UIKit

//1.定义字典
//1.不可变字典
let dict: [String : Any] = ["name": "liufeng", "age": 18, "height": 171]

//1.可变字典
var dictM = [String: Any]()

//2.对可变字典的基本操作
//增删改查
dictM["name"] = "liufeng"
dictM["age"] = 23
dictM["height"] = 168
dictM["boyFriend"] = false
dictM

dictM.removeValue(forKey: "age")
dictM

dictM["name"] = "chenbei"
dictM

dictM["name"]

//3.遍历字典
//3.1遍历字典中所有的key
for key in dictM.keys {
    key
}

//3.2遍历所有的值
for value in dictM.values {
    value
}

//3.3遍历所有的键值对
for (key, value) in dictM {
    key
    value
}

//4.合并字典
//即使类型一致，也不可以直接相加（+）合并
//如果想要合并，可以把一个加入另一个











