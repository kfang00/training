//
//  AddItemView.swift
//  HKPractice
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct AddItemView: View {
    @State private var name = ""
    @State private var quantity = 0
    @Binding var screen: Int
    @Binding var index: Int
    @ObservedObject var userList: Users
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    Text("Add Item to Cart")
                        .font(.title)
                        .padding()
                    TextField("Name", text: $name)
                    
                    Stepper("Quantity: \(self.quantity)", value: $quantity, in: 1...30)
                        .padding(.bottom, 20)
                    
                    Button("Add") {
                        //self.screen = 3
                        let item = Item(name: self.name, quantity: self.quantity)
                        self.userList.users[self.index].cart.items.append(item)
                    }
                    
                    ForEach(userList.users[self.index].cart.items, id:\.name) { item in
                        Text("\(item.name)")
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("HKPractice", displayMode: .inline)
        }
    }
}

//struct AddItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddItemView()
//    }
//}
