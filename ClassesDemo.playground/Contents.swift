//: Playground - noun: a place where people can play

import UIKit

class A {
    
    var x : Int
    var y = 10
    
    init() {
        
        print("init()");
        x = 0
        y = 0
    }
    
    init(x : Int, y : Int) {
        
        self.x = x
        self.y = y
    }
    
    func addition() {
        
        print("Addition: \(x + y)")
    }
    
    func setX(_ value: Int) {
        self.x = value
    }
    
    func setValueOf(_ y1 : Int, AndValueOfX x1 : Int) {
        
        y = y1
        x = x1
    }
    
    func getX() -> Int {
        
        return x
    }
}


func display () {
    print("display")
}

display()


func getValue() -> Int {
    
    return 10
}

var d = getValue()

d

var a = A()

a.x = 20
a.y = 30

a.x
a.y

var a1 = A(x: 1, y: 2)

a1.x
a1.y

a.addition()

a.setX(23)

a.setValueOf(12, AndValueOfX: 34)

a.x
a.y

a1.addition()

var s = a.getX()

s


/*
 
 1) Create class ComplexNumber
 
    real
    imag
 
    init()
    init(real, imag)
 
    setters
    getters
 
    addition(ComplexNumber) -> ComplexNumber
    substract(ComplexNumber) -> ComplexNumber
 
    display()           (real + imag i)     (1 + 3i)
 
 
 
 */


class ComplexNumber {
    var real : Int
    var image : Int
    init()
    {
        real = 0
        image = 0
    }
    
    init (real : Int, image : Int){
        self.real = real
        self.image = image
    }
    
    func setNumbers(_ i : Int, _ r : Int){
        image = i
        real = r
    }
    
    func getImage() -> Int {
        return image
    }
    
    func getReal() -> Int {
        return real
    }
    
    func addition(_ c2 : ComplexNumber) -> ComplexNumber {
        let C3 = ComplexNumber()
        C3.image = self.image + c2.image
        C3.real = self.real + c2.real
        return C3
    }
    
    func subtraction (_ c2 : ComplexNumber) -> ComplexNumber {
        let C3 = ComplexNumber()
        C3.image = self.image - c2.image
        C3.real = self.real - c2.real
        return C3
    }
    
    func display(){
        print("\(real)+\(image)i")
    }
}

var complex1 = ComplexNumber(real: 5, image: 3)
var complex2 = ComplexNumber(real: 10, image: 5)

var complex3 = complex1.addition(complex2)

complex3.display()

complex3  = complex2.subtraction(complex1)

complex3.display()





