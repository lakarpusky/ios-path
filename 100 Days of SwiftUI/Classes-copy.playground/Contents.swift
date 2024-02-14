import Cocoa

// TOPIC: How to copy classes

// .. classes are reference type:
// .. all copy of a class instance always point to the same piece of data
// .. changing one automatically change all the others too

class User {
    var username = "annonymous"
    
    // .. if you want to make an unique copy of a class instance `deep copy`
    // .. you are about to handling creating new instance and copying across properties by hand
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy() // .. so the change will no impact the original
user2.username = "taylor"
print(user1.username)
print(user2.username)
