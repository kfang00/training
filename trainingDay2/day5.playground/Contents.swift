import UIKit

//Writing functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()

//Accepting parameters
func square(number: Int) {
    print(number * number)
}
square(number: 8)

//Returning values
func square(numb: Int) -> Int {
    return numb * numb
}

//Parameter labels
func sayHello(to name: String) { //externally: to | internally: name
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

//Omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")


//Default parameters
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)

//Variadic functions - accept any number of parameters of the same type
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1, 2, 3, 4, 5)

//Writing throwing functions
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

//Running throwing functions
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

//inout parameters
func doubleInPlace(number: inout Int) { //can be changed within the function
    number *= 2
}
var myNum = 10
doubleInPlace(number: &myNum)
