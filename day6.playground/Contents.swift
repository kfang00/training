import UIKit

//Creating basic closures
let driving = { //creates a function without a name, and assigns that function to driving.
    print("I'm driving in my car")
}
driving()

//Accepting parameters in a closure
let drive = { (place: String) in
    print("I'm going to \(place) in my car")
}
drive("London") //no parameter labels

//Returning values from a closure
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)

//Closures as parameters

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

//Trailing closure syntax --> last parameter is a closure
travel() {
    print("I'm driving in my car")
}
