//
//  ContentView.swift
//  iExpense
//
//  Created by Kayla Fang on 9/29/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct ListMod:ViewModifier {
    var amountItem: Int
    
    func body(content: Content) -> some View {
        //pink
        var color = Color(red: 0.94, green: 0.2, blue: 0.55)
        
        if amountItem < 10 {
            //green
            color = Color(red: 0.13, green: 0.88, blue: 0.12)
        }
        else if amountItem < 100 {
            color = Color.yellow
        }
            
        return content
        .listRowBackground(color)
    }
}

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
                    .modifier(ListMod(amountItem: item.amount))
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
