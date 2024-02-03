import UIKit


// === How to add initializers for classes === //


// .. if a child class has any custom initializers
// .. it must always call parent's initializer after  it has finished setting up its own properties, if has any

// .. example:
class Vehicle {
    let isElectrict: Bool
    
    init(isElectric: Bool) {
        self.isElectrict = isElectric
    }
}

// .. making a car
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectrict:Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectrict)
    }
}

// .. making a instance of a car
let teslaX = Car(isElectrict: true, isConvertible: false)
