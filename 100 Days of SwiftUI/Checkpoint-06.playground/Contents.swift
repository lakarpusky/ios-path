import UIKit


// .. create a struct to store information about a car:
// .. includes: model, number of seats, current gear
// .. add a method to change gears up and down

struct Car {
    let model: String
    let seats: Int
    private(set) var gear = 1
    
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
    }
    
    mutating func changeGear(amount: Int) {
        gear += amount
    }
}

var car = Car(model: "tesla", seats: 3)
