//
//  ContentView.swift
//  Animations
//
//  Created by Kayla Fang on 9/27/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

//Building custom transitions using ViewModifier
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
        .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
        //call using .transition(.pivot)
    }
}

struct ContentView: View {
    @State private var animationAmount =  0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var letters = Array("Hello SwiftUI")
    @State private var isShowingRed = false

    var body: some View {
//Showing and hiding views with transitions
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        
//Animating gestures
//        HStack(spacing: 0) {
//            ForEach(0 ..< letters.count) {num in
//                Text(String(self.letters[num]))
//                .padding(5)
//                    .font(.title)
//                    .background(self.enabled ? Color.blue : Color.red)
//                    .offset(self.dragAmount)
//                    .animation(Animation.default.delay(Double(num) / 20))
//            }
//        }
//    .gesture(
//        DragGesture()
//            .onChanged{self.dragAmount = $0.translation}
//            .onEnded{_ in
//                self.dragAmount = .zero
//                self.enabled.toggle()
//            }
//    )
        
//        LinearGradient(gradient: Gradient(colors: [.yellow, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 15))
//            .offset(dragAmount)
//        .gesture(
//            DragGesture()
//                .onChanged {self.dragAmount = $0.translation }
//                .onEnded {_ in
//                    withAnimation(.spring()) {
//                        self.dragAmount = .zero
//                    } //explict
//                }
//        )
            //.animation(.spring()) //implict
        
//Controlling the animation stack
//        Button("Tap Me") {
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? Color.blue : Color.red)
//        .animation(.default)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
