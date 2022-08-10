
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

let myEagle = Eagle()
myEagle.fly()
myEagle.soar()
myEagle.layEgg()

let myPenguin = Penguin()
myPenguin.layEgg()
myPenguin.swim()
myPenguin.fly()
