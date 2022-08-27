
protocol CanFly {
    func fly()
}

// Why we extend the protocol?
// Because 'Protocol methods must not have bodies', so protocol cannot set default action like the 'class'.
// However, if we make extension of the protocol, it acts like the class inheritance.
// If so, why use the 'protocol' and 'extension' instead of the 'class'?
// The 'class' and 'inheritance' are 'Tight Coupling'.
// Whereas the 'protocol' and 'adpotion' are 'Loose Coupling'.
extension CanFly {
    func fly() {
        print("The Object takes off into the air.")
    }
}

class Bird {
    var isFemale = true

    func layEgg() {
        if isFemale {
            print("The bird makes a new bird in a shell.")
        }
    }
}

struct MyBird: CanFly {
}

class Eagle: Bird, CanFly {
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water.")
    }
}

struct Airplane: CanFly {
}

struct FlyingMuseum {
    func flyingDemo(_ flyingObject: CanFly) {   // We can accept the protocols to data type
        flyingObject.fly()
    }
}

let museum = FlyingMuseum()

let myPenguin = Penguin()
let myEagle = Eagle()
let myPlane = Airplane()

myPenguin.swim()
myEagle.fly()

museum.flyingDemo(myEagle)
museum.flyingDemo(myPlane)
