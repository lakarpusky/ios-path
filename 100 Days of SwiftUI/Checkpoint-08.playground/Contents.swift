import Cocoa

// TOPIC: Checkpoint 08

// .. make a protocol that describes a building
// .. require the following:
// .. 1. a property storing how many rooms
// .. 2. a proerty storing the cost as an integer
// .. 3. a property storing the name of the estate agent
// .. 4. a method for printing the sales summary
// .. crea two structs, House and Office, that conform to it

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var agentName: String { get }
    func salesSummary() -> Void
}

extension Building {
    func salesSummary() {
        print("Building with \(rooms) rooms | price: \(cost) | Sold by: \(agentName)")
    }
}

struct House: Building {
    let rooms: Int
    let cost: Int
    let agentName: String
    
    func salesSummary() {
        print("House with \(rooms) rooms | price: \(cost) | Sold by: \(agentName)")
    }
}

struct Office: Building {
    let rooms: Int
    let cost: Int
    let agentName: String
}

let house = House(rooms: 2, cost: 20_000, agentName: "Sterling Shuf")
let office = Office(rooms: 10, cost: 1_000_000, agentName: "Hakim Slum")

house.salesSummary()
office.salesSummary()
