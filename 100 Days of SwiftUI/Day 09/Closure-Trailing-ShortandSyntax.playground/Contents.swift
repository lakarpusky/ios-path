import UIKit


// === How to use trailing closures and shortand syntax === //


let team = ["gloria", "suzanne", "piper", "tiffany", "tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "tasha" {
        return true
    } else if name2 == "tasha" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstTeam)

// .. the func we provide to "sorted()" must provide two strings and return a boolean
// .. so why to we need to repeat ourselves in our closure?

// .. we don't need to specify the types of our two parameters they must be strings
// .. we don't need to specify a return type because it must be a boolean

let captainFirstTeamWithNoTypes = team.sorted(by: { name1, name2 in
    if name1 == "tasha" {
        return true
    } else if name2 == "tasha" {
        return false
    }
    
    return name1 < name2
})

// .. we just go ahead and start the closure directly
// .. swift can automatically provide parameter names for us, using "shorthand syntax"

// .. rely on specially named values that swift provide: "$0" and "$1" for the first and second parameters

let captainFirstTeamByShorthanSyntax = team.sorted {
    if $0 == "tasha" {
        return true
    } else if $1 == "tasha" {
        return false
    }
    
    return $0 < $1
}


// .. if we just wanted to do a reverse sort
// .. a single line of code we can remove the "return"

let reverseTeam = team.sorted { $0 > $1 }

// .. example:
// .. the "filter()" func so we could find all team players whose name begins with "T"

let tOnly = team.filter { $0.hasPrefix("t") }
print(tOnly)

// .. example:
// .. the "map()" func to transform the team names

let upperTeam = team.map { $0.uppercased() }
print(upperTeam)



// === Why does swift have trailing closure syntax? === //


// .. trailing closure syntax is designed to make code easier to read
// .. BUT some prefer to avoid it

// .. example:
// .. a func accepts a "Double" the a "closure"

func animate(duration: Double, animations: () -> Void) {
    print("starting a \(duration) second animation...")
    animations()
}

// .. we can call the func without a trailing closure
animate(duration: 3, animations: {
    print("fade out the image")
})

// .. many people don't use trailing closures
// .. BUT many more devs look at the }) at the end

// .. trailing closures allow us to clean that up
// .. while also removing the "animations" parameter label

animate(duration: 3) {
    print("fade in the image")
}

// .. trailing closures work best when their meaning is directly attached to the name of the function
