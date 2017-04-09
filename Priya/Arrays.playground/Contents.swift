//: Playground - noun: a place where people can play

import UIKit

var iArr : [Int]

iArr = []

iArr.count

iArr.insert(20, at:0)

iArr.append(30)
iArr.insert(contentsOf: [10,20,30], at: 2)

iArr.insert(15, at:5)

iArr.sort()

iArr[4] = 55
iArr.append(55)

iArr.capacity
iArr.count

iArr.popLast()

iArr.count
iArr.capacity

iArr.distance(from: 1, to:6)

iArr.index(of: 55)

var strArr :[String]

strArr = []

strArr.insert("ABC", at: 0)
strArr.append("ABC1")

strArr.endIndex

iArr.remove(at: 3)

iArr.endIndex

strArr.capacity

strArr.insert("EFG", at: 1)

strArr.insert("AAA", at: 0)

strArr.capacity

strArr.index(after: 2)
strArr.contains("AAA1")

