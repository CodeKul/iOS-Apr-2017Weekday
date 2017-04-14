//: Playground - noun: a place where people can play

import UIKit

class Shape{
    var edge1 : Double
    var edge2 : Double
    var edge3 : Double
    var radius : Double
    var area : Double
    
    init(){
     edge1 = 0
     edge2 = 0
     edge3 = 0
     radius = 0
     area = 0
    }
    
    func calculateArea(){
        area = 0
    }
    
    func display(){
        print("Area of the shape is : \(area)")
    }
}

class Circle : Shape{
  override init() {
        super.init()
    }
    
    func setRadius(r : Double){
        super.radius = r
    }
    
    override func calculateArea() {
        super.area = 3.14 * super.radius * super.radius

    }
}

class Square : Shape {
    
    override init(){
       super.init()
    }
    
    func setEdge(e : Double){
        super.edge1 = e
    }
    
    override func calculateArea() {
        super.area = super.edge1 * super.edge1
    }
}

class Rectangle : Shape{
    override init(){
        super.init()
    }
    
    func setEdge(e1 : Double, e2 : Double) {
        super.edge1 = e1
        super.edge2 = e2
    }
    
    override func calculateArea() {
        super.area = super.edge2 * super.edge2
    }
}

class Triangle : Shape{
    override init(){
        super.init()
    }
    
    func setEdge(e1 : Double, e2 : Double, e3 : Double){
        super.edge1 = e1
        super.edge2 = e2
        super.edge3 = e3
    }
    
    override func calculateArea() {
        super.area = super.edge1 * super.edge2 * super.edge3
    }
}

var O1 = Circle()
var O2 = Square()
var O3 = Rectangle()
var O4 = Triangle()

O1.setRadius(r : 10.5)
O1.calculateArea()
print("Circle")
O1.display()

O2.setEdge(e: 5)
O2.calculateArea()
print("Square")
O2.display()

O3.setEdge(e1: 5, e2: 4)
O3.calculateArea()
print("Rectangle")
O3.display()

O4.setEdge(e1: 4.5, e2: 6.1, e3: 2)
O4.calculateArea()
print("Triangle")
O4.display()