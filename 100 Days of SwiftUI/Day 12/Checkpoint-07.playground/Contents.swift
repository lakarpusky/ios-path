import UIKit

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

// .. dogs

class Dog: Animal {
    func speak() {
        print("dog barks")
    }
}

class Corgi: Dog {
    override func speak() {
        print("corgi barks")
    }
}

class Poodle: Dog {
    override func speak() {
        print("poodle barks")
    }
}
let dog = Dog(legs: 4)
let corgi = Corgi(legs: 4)
let poodle = Poodle(legs: 4)

dog.speak()
corgi.speak()
poodle.speak()

// .. cats

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("cat meows")
    }
}

class Persian: Cat {
    override func speak() {
        print("persian meows")
    }
}

class Lion: Cat {
    override func speak() {
        print("lion roars")
    }
}

let cat = Cat(legs: 4, isTame: true)
let persian = Persian(legs: 4, isTame: true)
let lion = Lion(legs: 4, isTame: false)

cat.speak()
persian.speak()
lion.speak()
