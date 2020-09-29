//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kayla Fang on 9/24/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
        .renderingMode(.original)
        .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
        
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var chosenAnswer = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var animationAmount = 0.0
    @State private var isTapped = false

    var body: some View {
        ZStack {
            //Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(image: self.countries[number])
                    }
                    .opacity( number != self.correctAnswer && self.isTapped ? 0.25 : 1)
                    .animation(.easeOut)
                    .rotation3DEffect(.degrees(number == self.correctAnswer ? self.animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                    .colorMultiply (self.scoreTitle == "Wrong" ? .red: Color(red: 255, green: 255, blue: 255, opacity: 1))
                    
                }
            
                Section {
                    Text("Current Score: \(score)")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text("\(scoreTitle)"), message: scoreTitle != "Correct" ? Text("That's the flag of \(countries[chosenAnswer]) \n Your score is \(score)") : Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            withAnimation {
                self.animationAmount += 360
                self.isTapped = true
            }
        } else {
            scoreTitle = "Wrong"
            score -= 1
            chosenAnswer = number
        }

        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        isTapped = false
        scoreTitle = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
