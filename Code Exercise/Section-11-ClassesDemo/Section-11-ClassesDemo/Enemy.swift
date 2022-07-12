class Enemy {
    var health: Int
    var attackStregth: Int

    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStregth = attackStrength
    }

    func move() {
        print("Walk forwards.")
    }

    func attack() {
        print("Land a hit, does \(attackStregth) damage.")
    }

    func takeDamage(amount: Int) {
        health -= amount
    }
}
