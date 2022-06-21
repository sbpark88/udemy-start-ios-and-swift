import UIKit
import Darwin

func loveCalculator() {
    let loveScore:Int = Int.random(in: 1...100)
    
    
    if loveScore == 100 {
        print("You love each other like Kanye loves Kanye.")
    } else {
        print("You'll be forever alone.")
    }
}

loveCalculator()
