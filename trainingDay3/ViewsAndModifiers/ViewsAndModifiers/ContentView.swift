//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Kayla Fang on 9/25/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct Title:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {

    var body: some View {
        Text("Hello, World!")
            .titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


