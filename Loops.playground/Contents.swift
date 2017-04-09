//: Playground - noun: a place where people can play

import UIKit


// while

var i = 0;
/*
while i < 10 {
    
    print("Codekul")
    
    i += 1
}*/

/*
repeat {
    
    print("Codekul")
    
    i += 1

}while i < 10
*/
/*
var arr = [1,2,3,4,5,6,7,8,9]

var range1 = 0...9

var x = 0
var y = 9

var range2 = 0..<arr.count

for a in arr {
    
    if a == 2 {
        continue
    }
    
    print("A: \(a)")
}

*/



var opt = 13
var arr = [1,2,3,4,5,6,7,8,9]

var range2 = 0..<9

range2.lowerBound

range2.upperBound

switch opt {
    
case 1:
    print("One")
    fallthrough
case 2:
    print("Two")
    fallthrough
case 3:
    print("Three")
case 4:
    print("Four")
case 5:
    print("Five")
case 6:
    print("Six")
case 7:
    print("Seven")
case 8:
    print("Eight")
case 9:
    print("Nine")
case 0:
    print("Zero")
default:
    print("Option is not a digit")
}
















