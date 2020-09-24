import UIKit

//Creating your own classes
class Dog {
    var name: String //no memberwise initializer
    var breed: String

    init(name: String, breed: String) { //needed
        self.name = name
        self.breed = breed
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")


//Class inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

//Overriding methods
class Dog1 {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle1: Dog1 {
    override func makeNoise() {
        print("Yip!")
    }
}

let poppy1 = Poodle1()
poppy1.makeNoise()

//Final classes
//final class Dog { --> no other class can inherit from it

//Copying objects
//struct - original and copy are different things
//class - both the original and copy point to the same thing

class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name) // Justin Bieber

//Deinitializers
//classes have deinitializers - code that gets run when an instance of a class is destroyed.

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

//Mutability
//constant struct, variable property = property cannot be changed
//constant class, variable property = property can be changed
class Singer1 {
    var name = "Taylor Swift"
}

let taylor = Singer1()
taylor.name = "Ed Sheeran"
print(taylor.name)
