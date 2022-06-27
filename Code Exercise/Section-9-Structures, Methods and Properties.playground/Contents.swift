import UIKit

// Structure
struct Town {
    // Properties
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    // Methods
    func fortify() {
        print("Defences increased!")
    }
}

// Town 1
var hogwarts = Town(name: "Hogwarts", citizens: ["Harry Potter", "Ron Weasley", "Hermione Granger"], resources: ["Grain": 100, "ore": 42, "Wool": 75])

print(hogwarts.citizens)
hogwarts.citizens.append("Ginny Weasley")
hogwarts.fortify()

print(hogwarts.citizens)
print(hogwarts.resources["Grain"]!)

// Town 2
var anotherTown = Town(name: "Nameless Island", citizens: ["Tom Hanks"], resources: ["Coconuts": 100])

print(anotherTown.citizens)


// They are 'Town'.
print(type(of: hogwarts))
print(type(of: anotherTown))


