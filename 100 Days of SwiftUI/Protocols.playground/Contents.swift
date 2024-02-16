import Cocoa

// TOPIC: How to create and use protocols

// .. a.k.a interfaces in other languages
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// .. "conforms" Vehicle
struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 2
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroot() {
        print("It's a nice day!")
    }
}

// .. "conforms" Vehicle
struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("tha's too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravekEstimate(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 300, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravekEstimate(using: [car, bike], distance: 150)
