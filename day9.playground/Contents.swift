import UIKit

//Initializers
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"

//Referring to the current instance
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name //self.name --> property | name --> parameter
    }
}

//Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person1 {
    var name: String
    lazy var familyTree = FamilyTree() //Swift will only create the FamilyTree struct when it’s first accessed

    init(name: String) {
        self.name = name
    }
}

var ed = Person1(name: "Ed")
ed.familyTree

//Static properties and methods
struct Student {
    static var classSize = 0 //share specific properties and methods across all instances of the struct
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
print(Student.classSize)

//Access control
struct Person2 {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}
let ed1 = Person2(id: "12345")
