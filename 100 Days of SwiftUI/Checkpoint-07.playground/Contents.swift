import Cocoa

// TOPIC: Checkpoint 07

// .. make a class hieranchy for animals
// .. start with Animal, add a legs property for the number of legs an animal has
// .. make Dog a subclass of Animal, giving it a `speak()` method that prints a dog barking string, but each subclass should print something different
// .. make Corgi and Poodle subclasses of Dog
// .. make Cat an Animal subclass, add a `speak()` method, with each subclass printin something different, and an `isTame` boolean, set with an initializer
// .. make Persian and Lion as subclasses of Cat

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("I'm a dog!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("I'm a cat!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("I'm a Corgi dog!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("I'm a Poodle dog!")
    }
}

final class Persian: Cat {
    override func speak() {
        print("I'm a Persian cat!")
    }
}

final class Lion: Cat {
    override func speak() {
        print("I'm a Lion: grrrr!")
    }
}

let lion = Lion(legs: 4, isTame: false)
lion.speak()
