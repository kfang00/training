import UIKit

//Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]

//Sets --> no order, items are unique
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])

//Tuples --> fixed in size, cannot add or remove, cannot change type
var name = (first: "Taylor", last: "Swift")
name.0 //Taylor
name.first //Taylor

//Arrays vs Sets vs Tuples
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville") //fixed, precise position or name
let set = Set(["aardvark", "astronaut", "azalea"]) //unique or check whether a specific item is in there extremely quickly
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"] //order matters or need duplicates

//Dictionaries --> keys: value
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]

//Dictionary default values
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte"] //nil
favoriteIceCream["Charlotte", default: "Unknown"]

//Creating empty collections
var teams = [String: String]()
teams["Paul"] = "Red"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
var result = Array<Int>()

//Enumerations
let result1 = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure

//Enum associated values --> attach extra data to an enum case
//enum Activity {
//    case bored
//    case running
//    case talking
//    case singing
//}

enum Activity  {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

//Enum raw values --> underlying data types for each case
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)

//enum Planet: Int {
//    case mercury = 1
//    case venus
//    case earth
//    case mars
//}


