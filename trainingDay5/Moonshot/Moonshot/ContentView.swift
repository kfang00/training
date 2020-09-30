//
//  ContentView.swift
//  Moonshot
//
//  Created by Kayla Fang on 9/30/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            List (0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
        .navigationBarTitle("SwiftUI")
        }
//        ScrollView(.vertical) {
//            //List would create instances of CustomText only when really needed.
//
//            VStack (spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//--------------------------------
//        VStack {
//            GeometryReader{ geo in
//                Image("dog")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    //fit or fill
//                    .frame(width: geo.size.width)
//                    //.clipped()
//            }
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
