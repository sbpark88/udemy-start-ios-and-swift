import UIKit
import Darwin

let loveScore:Int = loveCalculator()

if loveScore == 100 {
    print("You love each other like Kanye loves Kanye.")
} else {
    print("You'll be forever alone.")
}

func loveCalculator() -> Int {
    return Int(arc4random_uniform(101))
}
