//: Playground - noun: a place where people can play

//swift中如何导入框架
import UIKit

//创建对象
let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = UIColor.red

//数据类型
var a = 10
let b = 3.14

let m: Int
m = 20

//定义标识符
let aa: Int = 20
var bb: Double = 3.1415
bb = 3.141592654

//语句结束
//一般不加分号，一行有多条语句，则需用分号分割

//打印内容
print(a)
print(b)

//基本计算
let mm = a + Int(b)

//逻辑分支
if a > 0 {
    print("a > 0")
}

let result = a > mm ? a : mm

//guard else
let age = 20


func online(age: Int) -> Bool {
    guard age >= 18 else {
        return false
    }
    return true
}

online(age: age)

//switch
let sex = 1
switch sex {
case 0, 1:
    print("男")
//    fallthrough
default:
    print("女")
}

0...10
0..<10

//for循环
for i in 0...10 {
    print(i)
}

for _ in 0..<10 {
    print("Hello World")
}

//while循环
while a > 0 {
    print(a)
    a = a - 1
}

//repeat while
repeat {
    a = a + 1
    print(a)
}while a < 10
