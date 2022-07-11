let skeleton = Enemy(health: 100, attackStrength: 10)

let dragon = Dragon(health: 2000, attackStrength: 50)
dragon.wingSpan = 5
dragon.talk(speech: "My teeth are swords! My clawsare spears! My wings are a hurricane.")
dragon.move()
dragon.attack()
