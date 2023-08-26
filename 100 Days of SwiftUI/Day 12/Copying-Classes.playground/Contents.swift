import UIKit


// === How to copy classes === //


// .. all copies of a class instance share the same data,
// .. any changes you make to one copy will automatically change the other copies

// .. example:
class User {
    var username = "anonymous"
}

// .. instance of a class
var user1 = User()

// .. take a copy and change the "username" value
var user2 = user1
user2.username = "taylor"

print(user1.username)
print(user2.username)
