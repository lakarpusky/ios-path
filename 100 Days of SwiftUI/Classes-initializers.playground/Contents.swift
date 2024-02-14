import Cocoa

// TOPIC: How to add initializers for classes

// .. if a child class has any custom initializer, it must always call
// .. parent's initializer after finished setting up its own properties if has any

class Vehicle {
    let isEletrical: Bool
    
    init(isEletrical: Bool) {
        self.isEletrical = isEletrical
    }
}

class Car: Vehicle {
    let isConvertible = false
    
    // .. if a child class does not have any of his own initializer
    // .. it will automatically inherit the parent class initializer
    
    //init(isElectrical: Bool, isConvertible: Bool) {
        //self.isConvertible = isConvertible
        //super.init(isEletrical: isElectrical)
    //}
}

let teslaX = Car(isEletrical: true)
