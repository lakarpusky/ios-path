import Cocoa

// TOPIC: How to create a deinitializer for a class

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("user \(id): I'm alive!")
    }
    
    // .. you don't user `func` with deinitializers
    // .. deinitializers can never take parameters or return data
    // .. deinitializers run when the last copy of a class instance is detroyed
    // .. we never call deinitializers directly
    // .. structs don't have deinitializers
    // .. no parentheses
    deinit {
        print("user \(id): I'm dead!")
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i) // .. new instance
    print("user \(user.id): I'm in control!")
    users.append(user) // .. another reference
}

print("loop is finished!")
// .. deinitializer will only be called after last isntance is destroyed
users.removeAll()
print("array is clear!")
