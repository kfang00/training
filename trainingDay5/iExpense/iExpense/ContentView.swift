//
//  ContentView.swift
//  iExpense
//
//  Created by Kayla Fang on 9/29/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([ExpenseItem].self, from:items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) {item in
                    HStack {
                        VStack (alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                    .foregroundColor(Color.white)
                    .listRowBackground((item.amount < 10) ? Color.green:  Color(red: 255, green: 72, blue: 139))
//                    .listRowBackground((item.amount < 10) ? Color(red: 72, green: 255, blue: 78) :  Color(red: 255, green: 72, blue: 139))
                }
                .onDelete(perform: removeItems)
            
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddExpense = true
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    self.expenses.items.append(expense)
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    
    func removeItems( at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets )
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
