import UIKit


// === How to crate a deinitializer for a class === //


// .. Deinitializers:
// ...
// .. 1. you don't use "func"
// .. 2. never take parameters or return data, aren't even written with parentheses
// .. 3. automatically called when the final copy of a class instance is destroyed
// .. 4. handled automatically by the system
// .. 5. structs don't have deinitializers, because you can't coy them

// .. example:
class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("user \(id): I'm alive!")
    }
    
    deinit {
        print("user \(id): I'm dead!")
    }
}

// .. creating and destroying instances
for i in 1...3 {
    let user = User(id: i)
    print("user \(user.id): I'm in control!")
}

// .. example:
var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("user \(user.id): I'm in control!")
    users.append(user)
}

print("loop is finished!")
users.removeAll()
print("array is clear!")

// .. ARC: automatic reference counting
