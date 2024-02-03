import UIKit


// === How to create and use protocols === //

// .. example:
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set } // can't conform the protocol using a constant property
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// .. making a "Car" that conforms to "Vehicle"
struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    var distance = 100
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("i'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("it's a nice day")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("that's too slow! i'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)


struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("i'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

// .. protocols let us talk about the kind of functionality we want to work with,
// .. rather than the exact types.

// .. type annotation is required, because we can't provide a default value in a protocol
// .. just like how protocols can't provide implementations for methods

func getTravelEstimates(using vehicles: [Vehicle],  distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)


// .. example:
protocol Purchaseable {
    var name: String { get set }
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

func buy(_ item: Purchaseable) {
    print("i'm buying \(item.name)")
}

let book = Book(name: "book", author: "author")
let movie = Movie(name: "movie", actors: ["ac1", "ac2"])
let coffee = Coffee(name: "coffee", strength: 4)

buy(book)
buy(movie)
buy(coffee)

// .. protocols let us create bluprints of how our types share functionality
// .. it's not possible to create "set-only" properties
