import UIKit

var myDouble = 3.14159

var myRoundedDouble = String(format: "%.1f", arguments: [myDouble])
print(myRoundedDouble)

// If I want to another 'Double' not 'String'?
myDouble.round()  // It make the value to integer. How can I handling it?


