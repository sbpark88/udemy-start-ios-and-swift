import UIKit

// 1. Swift is also First-class functions.
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    operation(n1, n2)
}

func add(no1: Int, no2: Int) -> Int {
    no1 + no2
}

func multiply(no1: Int, no2: Int) -> Int {
    no1 * no2
}

calculator(n1: 2, n2: 5, operation: add)
calculator(n1: 2, n2: 5, operation: add(no1:no2:))
calculator(n1: 2, n2: 5, operation: multiply(no1:no2:))


// 2. We can use closures because of first-class functions
var result = calculator(n1: 2, n2: 5, operation: {(n1: Int, n2: Int) -> Int in n1 * n2})
print("2 x 5 = \(result)")

// We can leave out parameters data type, by using type inference.
result = calculator(n1: 3, n2: 5, operation: {(n1, n2) -> Int in n1 * n2})
print("3 x 5 = \(result)")

// Also we can leave out return type.
result = calculator(n1: 4, n2: 7, operation: {(n1, n2) in n1 * n2})
print("4 x 7 = \(result)")

// Furthermore, anonymous parameters are possible!
result = calculator(n1: 5, n2: 11, operation: {$0 * $1})
print("5 x 11 = \(result)")

// Trailing closures - It perfectly fits with Apple's minimalism philosophy!
result = calculator(n1: 7, n2: 4) {$0 * $1}
print("7 x 4 = \(result)")


// 3. Usage
let array = [6, 2, 3, 9, 4, 1]

// 3.1. Using First-class function
func addOne(n1: Int) -> Int {
    n1 + 1
}

array.map(addOne(n1:))

// 3.2. Using closures
var newArray = array.map({(n1: Int) -> Int in return n1 + 1})
print(newArray)

newArray = array.map({n1 in n1 + 2})
print(newArray)

newArray = array.map({$0 + 3})
print(newArray)

newArray = array.map{$0 + 4}
print(newArray)

// 4. More usages
// We can change [Int] to [String]
var strArray = array.map{"\($0)"}
print(strArray)




