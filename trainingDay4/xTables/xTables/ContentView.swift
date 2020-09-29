//
//  ContentView.swift
//  xTables
//
//  Created by Kayla Fang on 9/29/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct Question {
    var expression: String
    var answer: Int
}

struct ContentView: View {
    @State private var chosenTable = 1
    @State private var questionAmount = 0
    @State private var questionList = [Question]()
    
    @State private var isSetting = true
    @State private var isGame = false
    
    let questionNum = ["5", "10", "15", "All"]
    
    var body: some View {
        Group {
            if isSetting {
                NavigationView{
                    VStack (spacing: 5){
                        Text("Which multiplication table do you want to practice?")
                        HStack {
                            ForEach(1..<13) { number in
                                Button("\(number)") {
                                    self.chosenTable = number
                                }
                            }
                            .padding(5)
                        }
                        HStack {
                            ForEach(0..<questionNum.count) { number in
                                Button("\(self.questionNum[number])") {
                                    self.questionAmount = number
                                }
                            }
                            .padding(5)
                        }
                        Button(action: startGame) {
                            Text("Continue")
                        }
                        Spacer()
                        Text("Multiplication table: \(chosenTable)" )
                        Text("Number of Questions: \(questionNum[questionAmount])")
                    }
                    .navigationBarTitle("xTables")
                }
            }
            if isGame {
//                List {
//                    ForEach(questionList, id: \.self) {
//                        Text($0)
//                    }
//                }
            }
        }
    }
    
    func startGame() {
        isSetting = false
        isGame = true
        let numberQ = Int(questionNum[questionAmount]) ?? 0
        //Generating random questions
        for _ in 0 ..< numberQ {
            let randNum = Int.random(in: 1 ... 12)
            questionList.append(Question(expression: "\(chosenTable) x \(randNum)", answer: chosenTable * randNum))
        }
        //All case
        if numberQ == 0 {
            for x in 1 ... 12{
                questionList.append(Question(expression: "\(chosenTable) x \(x)", answer: chosenTable * x))
            }
        }
        questionList.shuffle()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
