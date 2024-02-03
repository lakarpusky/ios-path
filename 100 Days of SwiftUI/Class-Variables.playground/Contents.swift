import UIKit


// === How to work with variables inside classes === //

// .. example:
class User {
    var name = "paul"
}

let user = User()
user.name = "taylor"
print(user.name)

// .. example:
// .. we'd able to change the property, but also be able to change to a wholly new "Player"

class Player {
    var name = "doe"
}

var player = Player()
player.name = "john"
player = Player()
print(player.name)
