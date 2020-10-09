//
//  ContentView.swift
//  PicChallenge
//
//  Created by Kayla Fang on 10/8/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI
import CoreImage

struct ContentView: View {
    @State private var pictures = Pictures()
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State var name = ""
    @State private var screen = 0
    @State var isImage = false
    
//    enum LoadingState {
//        case addView, listView
//    }
//
//    @Static private var loadingState = LoadingState.listView
    
    var body: some View {
        Group {
            if screen == 0 {
                NavigationView {
                    VStack {
                        List(pictures.items) {pic in
                            NavigationLink(destination: DetailView(image: pic)) {
                                HStack {
                                    pic.image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 100)
                                    Text(pic.name)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .navigationBarTitle("PicChallenge")
                    .sheet(isPresented: $showingImagePicker, onDismiss: changeView) {
                        ImagePicker(image: self.$inputImage, isImage: self.$isImage)
                    }
                    .navigationBarItems(trailing:
                    Button(action: {
                        self.showingImagePicker = true
                    }) {
                        Image(systemName: "plus")
                    })
                }

            }
            else {
                AddNameView(pictures: $pictures, name: self.$name, screen: self.$screen, inputImage: $inputImage)
            }
        }
    }
    
    func changeView() {
        if isImage == false {return}
        //print(isImage)
        guard let inputImage = inputImage else { return }
        name = ""
        screen = 1
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
