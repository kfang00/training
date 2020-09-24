import UIKit

//Protocols
protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

//Protocol inheritance --> can inherit from mutliple protocols at the same time
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }


//Extensions --> add methods to existing types
extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number = 8
number.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

//Protocol extensions -->extend a whole protocol so that all conforming types get your changes.
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

//Protocol-oriented programming
protocol Identifiable1 {
    var id: String { get set }
    func identify()
}

extension Identifiable1 { //default
    func identify() {
        print("My ID is \(id).")
    }
}

struct User1: Identifiable1 {
    var id: String
}

let twostraws = User1(id: "twostraws")
twostraws.identify()
