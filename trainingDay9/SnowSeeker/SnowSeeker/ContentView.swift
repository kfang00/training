//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Kayla Fang on 10/14/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
//    @State private var isShowingAlert = false
    
    @State private var layoutVertically = false
    
    @Environment(\.horizontalSizeClass) var sizeClass



    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
//        Group {
//            if sizeClass == .compact {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//---------
//        Group {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//        .onTapGesture {
//            self.layoutVertically.toggle()
//        }
//-----------
//        Text("Hello, World!")
//        .onTapGesture {
//            self.selectedUser = User()
//        }
//        .alert(item: $selectedUser) { user in
//            Alert(title: Text(user.id))
//        }
//        .onTapGesture {
//            self.selectedUser = User()
//            self.isShowingAlert = true
//        }
//        .alert(isPresented: $isShowingAlert) {
//            Alert(title: Text(selectedUser!.id))
//        }
//--------------
//        NavigationView {
//            NavigationLink(destination: Text("New secondary")) {
//                Text("Hello, World!")
//            }
//            .navigationBarTitle("Primary")
//
//            Text("Secondary")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
