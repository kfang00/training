import UIKit

//For loops
let count = 1...10

for number in count {
    print("Number is \(number)")
}

print("Players gonna ")
for _ in 1...5 {
    print("play")
}

//While loops
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

//Repeat loops
var num = 1

repeat {
    print(num) //will run at least once
    num += 1
} while num <= 20

print("Ready or not, here I come!")

//Exiting loops
//break

//Existing multiple loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

//Skipping items
//continue

//Infinite loops
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}

