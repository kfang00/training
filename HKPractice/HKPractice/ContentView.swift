//
//  ContentView.swift
//  HKPractice
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userList = Users()
    //@ObservedObject var user = User(username: "None", password: "None", cart: [Item]())
    @State private var screen = 0
    @State private var index = 0
    
    
    var body: some View {
        Group {
            if screen == 0 {
                LoginView(screen: $screen, index: self.$index, userList: self.userList)
            }
            else if screen == 1{
                SignUpView(userList: self.userList, screen: $screen)
            }
            else if screen == 2 {
                AddItemView(screen: $screen, index: self.$index, userList: self.userList)
            }
            else {
                CartView()
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://hkp-ios-demo-api.herokuapp.com/") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedUsers = try? JSONDecoder().decode(Users.self, from: data) {
                    DispatchQueue.main.async {
                        self.userList.users = decodedUsers.users
                    }

                    return
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")

        }.resume()
    }
//    func placeOrder() {
//        guard let encoded = try? JSONEncoder().encode(order) else {
//            print("Fail to encode order")
//            return
//        }
//        let url = URL(string: "https://reqres.in/api/cupcakes")!
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        request.httpBody = encoded
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
//                self.showingAlert = true
//                self.showingConfirmation = true
//                return
//            }
//            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
//                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
//                self.showingAlert = false
//                self.showingConfirmation = true
//            } else {
//                print("Invalid response from server")
//            }
//        }.resume()
        
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
