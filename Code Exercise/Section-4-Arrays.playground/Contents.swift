import UIKit

// Make thenew arrays by multiply current value and next value.

let numbers: Array<Int> = [45, 73, 195, 53]

var computedNumbers1: Array<Int> = []
var computedNumbers2: Array<Int> = []

for i in 0..<(numbers.count - 1) {
    computedNumbers1.append(numbers[i] * numbers[i + 1])
}

let numbersCount = numbers.count

for i in 0..<numbersCount {
    // I cannot use do try catch, because Swift do not catch runtime error.
    // Swift see that developer's mistake, so app throw the fatal error.
    // That means I cannot write the code by EAFP, have to write the code by LBYL.
    // I think using the rest to index of array, is very simple trick, however, it is safe!!
    computedNumbers2.append(numbers[i % numbersCount] * numbers[(i + 1) % numbersCount])
}

print(computedNumbers1)
print(computedNumbers2)
