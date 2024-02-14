import Cocoa

// TOPIC: How to work with variables inside classes

// .. every copy of a class instance point to the same pieace of underline data
// .. changing one copy will automatically change the other copies too
// .. but also affects the way we handle variables stored inside classes

class User {
    var name = "paul"
}

let user = User()
// .. we changed the user name
// .. but the actual class instance itself, the object we created has not changed
// .. in fact can't be changed bc we made it a constant
user.name = "taylor"
print(user.name)

// .. we end up with four possible situations:

// .. 1. CC-CP: constant class, constant property
// .. 2. CC-VP: constant class, variable property
// .. 3. VC-CP: variable class, constant property
// .. 4. VC-VP: variable class, variable property

// .. 1. CC-CP: always point to the same user, who always has the same name
// .. 2. CC-VP: always point to the same user, but their name can canche
// .. 3. VC-CP: can point to different users, but thir names never change
// .. 4. VC-VP: can point to different users, and those users can slso change their names
