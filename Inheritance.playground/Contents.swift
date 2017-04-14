//: Playground - noun: a place where people can play

import UIKit

class A {
    
    var a : Int
    
    init() {
        
        a = 0
    }
    
    init( a : Int) {
        self.a = a
    }
    
    func display() {
        
        print("Value a: \(a)")
    }
    
}

class C : A {
    
    var c : Int
    
    override init() {
        c = 0
        super.init()
    }
    
    init(a : Int, c : Int) {
        
        self.c = c
        super.init(a: a)
    }

    override func display() {
        
        print("Value c: \(c)")
    }
    
}

class B : C {
    
    var b : Int
    
    override init() {
        b = 0
        super.init()
    }
    
    init(a : Int, b : Int, c : Int) {
        
        self.b = b
        super.init(a: a, c: c)
    }
    
    override func display() {
        
        print("Value b: \(b)")
    }
    
}


var b1 = B(a: 1, b: 2, c: 3)

b1.display()

var b2 = B()

b2.display()

var b3 : B

b3 = B()

b3.display()

b1.a





