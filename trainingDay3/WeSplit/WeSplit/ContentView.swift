//
//  ContentView.swift
//  WeSplit
//
//  Created by Kayla Fang on 9/24/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: [Double] {
        //calculate the total per person here
        let peopleCount = (Double(numberOfPeople) ?? 1)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        let returnedAmounts:[Double] = [amountPerPerson, grandTotal]
        
        return returnedAmounts //returns the amount per person and the grand total
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
//                    Picker("Number of People", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                    TextField("Number Of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    
                }
                
                Section (header: Text("How much tip dp you want to leave?")) {
                    Picker("Tip Percentages", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) { number in
                            Text("\(self.tipPercentages[number])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section (header: Text("Amount per person")) {
                    Text("$\(totalPerPerson[0], specifier: "%.2f")")
                }
                
                Section (header: Text("Check Total")) {
                    Text("$\(totalPerPerson[1], specifier: "%.2f")")
                        .foregroundColor( tipPercentage == 4 ? .red : .black)
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
