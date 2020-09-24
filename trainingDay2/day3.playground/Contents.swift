import UIKit

//Arithmetic operations
// +, -, *, /, %

//Operator overloading --> what an operator does depends on the values you use it with.
//adding numbers; joining strings and arrays

//Compound assignment operators
//-=; += etc

//Comparison operators
let firstScore = 6
let secondScore = 4

firstScore == secondScore
firstScore != secondScore // >, <, >= etc

//Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

//Combining Conditions
//&&; ||

//The ternary operator --> three values at once
let firstC = 11
let secondC = 10
print(firstC == secondC ? "Cards are the same" : "Cards are different")
//true -> "cards are the same"
//false -> "cards are different"

//switch statements --> If you have several conditions using if and else if
//Swift will only run the code inside each case
let weather = "sunny"
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough //continue onto next case
default:
    print("Enjoy your day!")
}

//Range operators
//..< (exclusing final) and ... (including final)
let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
