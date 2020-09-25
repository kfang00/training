//
//  ContentView.swift
//  challengeDay
//
//  Created by Kayla Fang on 9/24/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputVal = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    //Converts all inputUnits to Celsius
    func convertToC (num: Double, type: String) -> Double {
        switch type {
        case "Celsius":
            return num
        case "Fahrenheit":
            return (num - 32) * (5 / 9)
        case "Kelvin":
            return num - 273
        default:
            return 0
        }
    }
    
    //converting to output unit
    var convertToOutput: Double {
        let inputNum = Double(inputVal) ?? 0
        let chosenUnit = units[inputUnit]
        let inputC = convertToC(num: inputNum, type: chosenUnit)
        let chosenOutUnit = units[outputUnit]
        switch chosenOutUnit {
        case "Celsius":
            return inputC
        case "Fahrenheit":
            return (inputC * (9 / 5)) + 32
        case "Kelvin":
            return inputC + 273
        default:
            return 0
        }
        
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section (header: Text("Input Value")){
                    TextField("Number", text: $inputVal)
                        .keyboardType(.decimalPad)
                }
                Section (header: Text("Choose an input unit")){
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) { number in
                            Text("\(self.units[number])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section (header: Text("Choose an output unit")){
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) { number in
                            Text("\(self.units[number])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section (header: Text("Output Value")){
                    Text("\(convertToOutput, specifier: "%.2f") \(units[outputUnit])")
                }
            }
        .navigationBarTitle("TempConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
