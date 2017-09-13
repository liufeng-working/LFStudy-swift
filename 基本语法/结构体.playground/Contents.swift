//: Playground - noun: a place where people can play
//结构体

import UIKit

struct Location{
    var latitude: Double = 0
    var longitude: Double = 0
}

var location = Location(latitude: 37.3230, longitude: -122.0322)
location.latitude = 0
location.longitude

Location()

struct Place{
    let location: Location
    var name: String
}

let place = Place(location: location, name: "谷歌")
place.location.latitude

struct L {
    var latitude: Double = 0
    var longitude: Double = 0
    
    init(coordinateString: String) {
        let commaIndex = coordinateString.range(of: ",")!.lowerBound
        let first = coordinateString.substring(to: commaIndex)
        self.latitude = Double(first)!
        self.longitude = 0
    }
    
    func printLocation() {
        print("location")
    }
}

let l = L(coordinateString: "22,112")
l.latitude
l.longitude

struct Point {
    let x = 0
    let y = 0
}

let p1 = Point()
p1

let p2 = p1


            
