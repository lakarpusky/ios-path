import Cocoa

// TOPIC: Hot to store and find data in dictionaries

let employee = ["Taylor", "Singer", "Nashville"]

print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("Location: \(employee[2])")

let employee2 = [
    "name": "Taylor",
    "job": "Singer",
    "location": "Nashville",
]

// .. set default value if not exits
print(employee2["name", default: "unknowm"])
print(employee2["job", default: "unknown"])
print(employee2["location", default: "unknown"])

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

let olympics = [
    2012: "London",
    2016: "Rio",
    2021: "Tokyo"
]

print(olympics[2012, default: "unknown"])

var heights = [String: Int]()
heights["Yao"] = 229
heights["O'Neal"] = 216
heights["James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"
