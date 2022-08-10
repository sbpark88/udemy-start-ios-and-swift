class Bird {
    var isFemale = true

    func layEgg() {
        if isFemale {
            print("The bird makes a new bird in a shell.")
        }
    }

    func fly() {
        print("The bird flaps its wings and lifts off into the sky.")
    }
}

class Eagle: Bird {
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(_ flyingObject: Bird) {
        flyingObject.fly()
    }
}

class Airplane: Bird {
    override func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
}

let museum = FlyingMuseum()

let myPenguin = Penguin()
museum.flyingDemo(myEagle)

let myEagle = Eagle()
museum.flyingDemo(myPenguin)

let myPlane = Airplane()
museum.flyingDemo(myPlane)