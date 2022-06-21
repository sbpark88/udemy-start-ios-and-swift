import UIKit
import Darwin

func loveCalculator() {
    let loveScore:Int = Int.random(in: 1...100)
    
    
    if loveScore > 80 {
        print("You love each other like Kanye loves Kanye.")
    } else if (loveScore <= 80) && (loveScore >= 40) {
        print("You go together like Coke and Mentos.")
    } else {
        print("You'll be forever alone.")
    }
}

loveCalculator()
