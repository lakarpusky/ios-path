import Cocoa

// TOPIC: Checkpoint 06

// .. Create a struct to store information about a car. Include:
// .. 1. its model
// .. 2. number of seats
// .. 3. current gear

// .. - add a method to change gears up or down
// .. - have a think about variables and access control
// .. - don't allow invalid gears -1...10 seems a fair maximum range

struct Car {
    private(set) var model: String
    private(set) var seats: Int
    private(set) var gear = 1
    
    mutating func gearUp(by value: Int) {
        if value >= 1 && value <= 10 {
            gear += value
        }
    }
    
    mutating func gearDown(by value: Int) {
        if value >= 1 && value <= 10 {
            gear -= value
        }
    }
}

var car = Car(model: "Toyota", seats: 4)
print("the \(car.model) has \(car.seats) seats and \(car.gear) gear.")
car.gearUp(by: 10)
car.gearDown(by: 3)
print(car.gear)
