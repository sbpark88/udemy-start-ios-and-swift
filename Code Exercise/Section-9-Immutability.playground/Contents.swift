import UIKit

struct Town {
    
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(citizens: [String], name: String, resources: [String: Int]) {
        self.citizens = citizens
        self.name = name.uppercased()
        self.resources = resources
    }
    
    // Cannot assign through subscript: 'self' is immutable.
    // In value type, all properties are self even if I make properties with 'var' keyword.
    // Thus, self is immutable like let.
    mutating func earn() {
        guard let _ = resources["Galleon"] else { return }
        resources["Galleon"]! += 20
        
    }
}

func address(of object: UnsafeRawPointer) -> NSString {
    let address = Int(bitPattern: object)
    return NSString(format: "%p", address)
}

var hogwarts = Town(citizens: ["Harry", "Ron", "Hermione"], name: "Hogwarts", resources: ["Galleon": 80])

print(hogwarts.resources)


// If I want to change the instance, what have I to do?
// 1. Instance should be variable, so it is declared using 'var'.
// 2. The properties of the instance, must be variable with 'var', not constance.
hogwarts.resources["Galleon"] = 100
print(hogwarts.resources)

hogwarts.earn()
print(hogwarts.resources)




