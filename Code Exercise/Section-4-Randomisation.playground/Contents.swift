import UIKit

// The number of letters in alphabet equals 26.
let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                "u", "v", "w", "x", "y", "z"]

// Make a password with 6 characters by randomly selected.
var temp = ""

for _ in 0..<6 {
    temp += alphabet.randomElement()!
}

let password = temp

print(password)
