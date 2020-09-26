//
//  ContentView.swift
//  RP&S
//
//  Created by Kayla Fang on 9/25/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct CapsuleView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 200, height: 150)
            .font(.largeTitle)
            .foregroundColor(.white)
            
    }
}

struct ContentView: View {
    static var question = 1
    @State private var randHand = Int.random(in: 0 ... 2)
    @State private var randState = Int.random(in: 0 ... 1)
    @State private var haveWon = false
    @State private var score = 0
    @State private var showScreen = false
    @State private var endScreen = false
    
    let hands = ["Rock", "Paper", "Scissors"]
    let state = ["Win", "Lose"]
    
    var body: some View {
        NavigationView {
            VStack (spacing: 10) {
                Text("Q\(ContentView.question) We played \(hands[randHand])!")
                    .font(.title)
                Text("Try To \(state[randState])!")
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.buttonTapped("\(self.hands[number])")
                    }) {
                        CapsuleView(text: "\(self.hands[number])")
                            .background(self.hands[number] == "Rock" ? Color.pink : self.hands[number] == "Paper" ? Color.orange : Color.yellow)
                            .clipShape(Capsule())
                    }
                }
                
                Section {
                    Text("Current Score: \(score)")
                        .font(.caption)
                }
            }
            .navigationBarTitle(Text("RP&S"), displayMode: .inline)
            .alert(isPresented: $showScreen) {
                Alert(title: haveWon ? Text("Correct") : Text("Wrong"), message: self.endScreen ? Text("Game End! Your score is \(score)") : Text("Your score is \(score)"), dismissButton: self.endScreen ? .default(Text("Try Again") ) {
                    self.resetGame()
                    }: .default(Text("Continue") ) {
                        self.reset()
                    } )
            }
            VStack {
                Section {
                    Text("Current Score: \(score)")
                        .font(.caption)
                }
            }
            .alert(isPresented: $endScreen) {
                Alert(title: Text("Game End!"), message: Text("Your score is \(score)"), dismissButton: .default(Text("Try Again") ) {
                        self.resetGame()
                })
            }

        }
    }
    
    func buttonTapped(_ choice: String) {
        switch choice {
        case "Rock":
            if self.randState == 0 && self.randHand == 2 {
                self.haveWon = true
            }
            else if self.randState == 1 && self.randHand == 1 {
                self.haveWon = true
            }
                
        case "Paper":
            if self.randState == 0 && self.randHand == 0 {
                self.haveWon = true
            }
            else if self.randState == 1 && self.randHand == 2 {
                self.haveWon = true
            }
            
        case "Scissors":
            if self.randState == 0 && self.randHand == 1 {
                self.haveWon = true
            }
            else if self.randState == 1 && self.randHand == 0 {
                self.haveWon = true
            }
        default:
            self.haveWon = false
        }
        if haveWon {
            self.score += 1
        }
        else{
            self.score -= 1
        }
        self.showScreen = true //raise the alert
        if ContentView.question == 10 {
            self.endScreen = true
        }
    }
    
    func reset() {
        self.haveWon = false
        self.randHand = Int.random(in: 0 ... 2)
        self.randState = Int.random(in: 0 ... 1)
        ContentView.question += 1
    }
    
    func resetGame() {
        self.haveWon = false
        self.randHand = Int.random(in: 0 ... 2)
        self.randState = Int.random(in: 0 ... 1)
        self.endScreen = false
        ContentView.question = 1
        self.score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
