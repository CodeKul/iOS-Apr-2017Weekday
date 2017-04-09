//: Playground - noun: a place where people can play

import UIKit

/*
 
 1) Arithmetic
 
 +
 -
 *
 /
 %
 
 */

var a = 10

var b = 20

var res = b + a

res = b - a

res = b * a

res = b / a

//res = 44.0 / 3

var res1 =  13 / 44.0

res1

a = 3

b = 13

res = b % a

var c = 10.40

var d = 40.10

//res1 = c % d

print("\(44.0 / 3.0)")

/*
 2) Assignment
 
 =
 
 -Compound assignment
 
 +=
 -=
 *=
 /=
 %=
 
 */

a = 10
b = 10

a += b  // a = a + b

a -= (b + 20)

b *= 3

b /= 2

b %= 2

/*
 
 3) Comaprision
 
 <
 >
 ==
 !=
 <=
 >=
 
 */
var bool = a < b

a > b

a = b

a > b

a >= b

a != b

(b * 30) == (a - 40)


/*
 
 4) Logical
 
 &&
 ||
 !
 
        p   q   p&&q  p||q  !p
        1   1   1       1   0
        1   0   0       1   0
        0   1   0       1   1
        0   0   0       0   1
 
 */

a = 10
b = 30

var res2 = !(a < b) && a < 10

res2 = !(a > 5 || b > 40)

res2 = true

/*
 
 5) Special types
 
 
 */

var s1 = "ABCD"

var s2 = "ABCD"

var s3 = s1 + s2 + "10"

s3 += s2

s1 < s2

s1 == s2



/*
 
 6) Ternary

 condition ?  true part : false part
 
 */

var v1 = a < b ? "a is less" : "b is less"




















