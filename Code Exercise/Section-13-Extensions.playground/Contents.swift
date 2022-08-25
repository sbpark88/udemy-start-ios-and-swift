import UIKit

let myDouble = 3.14159

var myRoundedDouble = String(format: "%.1f", arguments: [myDouble])
print("Origin Number: \(myRoundedDouble)")

// If I want to another 'Double' not 'String'?
var myDoubleCopy = myDouble
myDoubleCopy.round()
print("Original round method: \(myDoubleCopy)")  // It make the value to integer. How can I handling it?

/*  Make the 'Custom methods' using extensions.  */


//let precisionNumber = Double(pow(10, 3))    // error: Ambiguous use of 'pow'
//let precisionNumber = pow(Double(10), 3)    // error: Invalid redeclaration of 'precisionNumber'


extension Double {

    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }

}


print("Extended round method: \(myDouble.round(to: 3))")


/*  We can extend apple's library like UIKit.  */
let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red

button.layer.cornerRadius = 25
button
button.clipsToBounds = true



extension UIButton {
    
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
    }
    
}

// Now we can make round button using extension method 'makeCircular()'.
let newButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
newButton.backgroundColor = .green
newButton.makeCircular()

