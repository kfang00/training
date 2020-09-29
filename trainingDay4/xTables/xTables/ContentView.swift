//
//  ContentView.swift
//  xTables
//
//  Created by Kayla Fang on 9/29/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct Buttons:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.black)
            .opacity(0.85)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Question{
    
    var expression: String
    var answer: Int
    var number: Int
    
    init(equation: String, ans: Int, num: Int) {
        self.expression = equation
        self.answer = ans
        self.number = num
        
    }
}

struct ContentView: View {
    @State private var chosenTable = 1
    @State private var questionAmount = 0
    @State private var questionList = [Question]()
    @State private var answerList = [String](repeating: "", count: 15)
    
    @State private var isSetting = true
    @State private var isGame = false
    
    @State private var currentQuesIndex = 0
    
    @State private var score = 0
    @State private var showingScore = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var isTapped = false
    @State private var isTapped2 = false
    @State private var animationAmount = 0.0
    
    let questionNum = ["5", "10", "15", "All"]
    
    var body: some View {
        Group {
            if isSetting {
                NavigationView{
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.yellow, .pink, .blue]), startPoint: .top, endPoint: .bottom)
                         .edgesIgnoringSafeArea(.all)
                        VStack (spacing: 10){
                            Text("Which multiplication table do you want to practice?")
                            HStack {
                                ForEach(1..<5) { number in
                                    Button(action: {
                                        self.buttonTapped(num: number)
                                    }) {
                                        Text("\(number)")
                                    }
                                    .frame(width: 75, height: 75)
                                    .background(self.isTapped && number == self.chosenTable ? Color.pink : Color.white)
                                    .modifier(Buttons())
                                    .animation(.spring())
                                    
                                }
                            }
                            HStack {
                                ForEach(5..<9) { number in
                                    Button(action: {
                                        self.buttonTapped(num: number)
                                    }) {
                                        Text("\(number)")
                                    }
                                    .frame(width: 75, height: 75)
                                    .background(self.isTapped && number == self.chosenTable ? Color.pink : Color.white)
                                    .modifier(Buttons())
                                    .animation(.spring())
                                }
                            }
                            HStack {
                                ForEach(9..<13) { number in
                                    Button(action: {
                                        self.buttonTapped(num: number)
                                    }) {
                                        Text("\(number)")
                                    }
                                    .frame(width: 75, height: 75)
                                    .background(self.isTapped && number == self.chosenTable ? Color.pink : Color.white)
                                    .modifier(Buttons())
                                    .animation(.spring())
                                    
                                }
                            }
                            Text("How many questions?")
                            HStack {
                                ForEach(0..<questionNum.count) { number in
                                    Button(action: {
                                        self.buttonTapped2(num: number)
                                    }) {
                                        Text("\(self.questionNum[number])")
                                    }
                                    .frame(width: 75, height: 65)
                                    .background(self.isTapped2 && number == self.questionAmount ? Color.blue : Color.white)
                                    .modifier(Buttons())
                                    .animation(.spring())
                                    
                                }
                            }
                            Button(action: startGame) {
                                Text("Continue")
                            }
                            Spacer()
                            Text("Multiplication table: \(chosenTable)" )
                            Text("Number of Questions: \(questionNum[questionAmount])")
                        }
                        .navigationBarTitle("xTables")
                        .foregroundColor(.white)
                        .padding(10)
                    }
                }
            }
            if isGame {
                NavigationView{
                    VStack {
                        Form {
                            Section (header: Text("Try these problems!")){
                                ForEach(questionList, id: \.number) { ques in
                                    HStack {
                                        Text("\(ques.expression) = ")
                                        TextField("Answer", text: self.$answerList[ques.number - 1])
                                    }
                                }
                            }
                        }
                        .foregroundColor(Color.blue)
                        Button(action: checkAns) {
                            Text("Check Answers")
                        }
                        .padding(5)
                    }
                    .navigationBarTitle("xTables")
                }
                .alert(isPresented: $showingScore) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Try Again")) {
                        self.resetGame()
                    })
                }
            }
        }
    }
    
    func startGame() {
        isSetting = false
        isGame = true
        let numberQ = Int(questionNum[questionAmount]) ?? 0
        //Generating random questions
        if numberQ != 0 {
            for x in 1 ... numberQ {
                let randNum = Int.random(in: 1 ... 12)
                questionList.append(Question(equation: "\(chosenTable) x \(randNum)", ans: chosenTable * randNum, num: x))
            }
        }
        //All case
        var allCombo = [1,2,3,4,5,6,7,8,9,10,11,12]
        allCombo.shuffle()
        if numberQ == 0 {
            for x in 1 ... 12{
                questionList.append(Question(equation: "\(chosenTable) x \(allCombo[x - 1])", ans: chosenTable * allCombo[x - 1], num: x))
            }
        }
    }
    
    func buttonTapped(num : Int) {
        self.chosenTable = num
        withAnimation {
            self.animationAmount += 360
            self.isTapped = true
        }
    }
    
    func buttonTapped2(num : Int) {
        self.questionAmount = num
        withAnimation {
            self.animationAmount += 360
            self.isTapped2 = true
        }
    }
    
    func checkAns() {
        for a in 0 ..< questionList.count {
            print(Int(answerList[a]) ?? 0)
            if Int(answerList[a]) ?? 0 == questionList[a].answer {
                score += 1
            }
        }
        showingScore = true
        alertTitle = "You Did It"
        alertMessage = "You got \(score)/\(questionList.count) correct!"
    }
    
    func resetGame() {
        isSetting = true
        isGame = false
        chosenTable = 1
        questionAmount = 0
        questionList = [Question]()
        answerList = [String](repeating: "", count: 15)
        currentQuesIndex = 0
        score = 0
        showingScore = false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
