import UIKit


// .. a protocol that describes a building
protocol Building {
    var rooms: Int { get }
    var cost: Double { get }
    var agent: String { get }
    
    func salesSummary() -> String
}

extension Building {
    func salesSummary() -> String {
        "selled by \(agent) total of $\(cost)"
    }
}

struct House: Building {
    var rooms: Int
    var cost: Double
    var agent: String
}

struct Office: Building {
    var rooms: Int
    var cost: Double
    var agent: String
}

let house = House(rooms: 2, cost: 50_000, agent: "solari")
let office = Office(rooms: 6, cost: 300_000, agent: "pina")
