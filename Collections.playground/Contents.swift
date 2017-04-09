//: Playground - noun: a place where people can play

import UIKit

// Arrays


var arr = [1,2,3,4,5,6,7,8,9]

var arr1 : [Int]

var arrStr : [String]

arr.append(10)

arr.count

arr[6]

arr.insert(11, at: 10)


arr.insert(30, at: 5)

arr.popLast()


//arr.append("abc")

arr1 = []

arr1.insert(1, at: 0)


// Dictionary


var dict = ["key1" : "value1", "key2" : "value2", "key3" : "value3"]

dict["key1"]


var stuDict = ["name" : "Stu1", "rno" : "1", "marks" : "100"]

stuDict["name"] = "Stu2"

var dict2 : [String : Int]

dict2 = ["key1" : 12]

dict2.count

dict2["key1"] = nil

dict2.count


var dict3 = ["array1" : arr]

dict3["array"]?[7]


var str : String?

str = nil

str = "str"
var str1 : String


str1 = str!


var a : Int

str = "10"

a = Int(str!)!














