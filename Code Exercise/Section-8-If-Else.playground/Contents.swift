import UIKit
import Darwin

func loveCalculator() {
    loveCalculator(loveScore: Int.random(in: 1...100))
}

func loveCalculator(loveScore: Int) {
    /*if loveScore > 80 {
        print("You love each other like Kanye loves Kanye.")
    } else if loveScore >= 40 {
        print("You go together like Coke and Mentos.")
    } else {
        print("You'll be forever alone.")
    }*/

    switch loveScore {
        case 1..<40:
            print("You'll be forever alone.")
        case 40..<80:
            print("You go together like Coke and Mentos.")
        default:
        print("You love each other like Kanye loves Kanye.")
    }
    
}

loveCalculator(loveScore: 39)   // You'll be forever alone.
loveCalculator(loveScore: 40)   // You go together like Coke and Mentos.
loveCalculator(loveScore: 41)   // You go together like Coke and Mentos.
loveCalculator(loveScore: 79)   // You go together like Coke and Mentos.
loveCalculator(loveScore: 80)   // You go together like Coke and Mentos.
loveCalculator(loveScore: 81)   // You love each other like Kanye loves Kanye.

loveCalculator()



