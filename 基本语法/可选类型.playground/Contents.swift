//: Playground - noun: a place where people can play

import UIKit

class Student: NSObject {
    var name: String? = nil
    
}

var name: Optional<String> = nil

var age: String? = nil

name = "chenbei"
print(name!) //强制解包

if name != nil {
    print(name!)
}

//可选绑定
if let name = name {
    print(name)
}

let url: NSURL? = NSURL(string: "https://www.baidu.com")

if let url = url {
    let request = NSURLRequest(url: url as URL)
}



