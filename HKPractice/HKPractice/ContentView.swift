//
//  ContentView.swift
//  HKPractice
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    //@ObservedObject var user = User(username: "None", password: "None", cart: [Item]())
    @State private var screen = 0
    
    
    var body: some View {
        Group {
            if screen == 0 {
                LoginView()
            }
            else if screen == 1{
                SignUpView()
            }
            else if screen == 2 {
                AddItemView()
            }
            else {
                CartView()
            }
        }
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
                if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedUsers
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
