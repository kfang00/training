import UIKit

//Handling missing data
var age: Int? = nil
age = 38

//Unwrapping optionals - if let syntax: unwraps with a condition. If there was a value inside the optional then you can use it, but if there wasn’t the condition fails.
var name: String? = nil
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

//Unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return //if find nil, then exit
    }

    print("Hello, \(unwrapped)!")
}

//Force unwrapping
let str = "5"
let num = Int(str) // optional int
let num1 = Int(str)! //regular int

//Implicitly unwrapped optionals
let age1: Int! = nil

//Nil coalescing --> unwarp optional and return the valueinside if there is one
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous" //if nil then use "Anonymous"

//Optional chaining\
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased() //if ? is nil then the rest of the line will be ignored

//Optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit") // when you know the function will not fail.
print("OK!")

//Failable initializers - an initializer that might work or might not.
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

//as? returns an optional - nil if the typecast fails



