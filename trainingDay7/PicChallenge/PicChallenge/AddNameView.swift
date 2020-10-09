//
//  AddNameView.swift
//  PicChallenge
//
//  Created by Kayla Fang on 10/8/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct AddNameView: View {
    @Binding var pictures : Pictures
    @Binding var name: String
    @Binding var screen: Int
    @State var image: Image?
    @Binding var inputImage: UIImage?
    
    
    var body: some View {
        Form{
            VStack {
                Text("Enter the name for your photo")
                    .font(.headline)
                TextField("Enter Name", text: $name )
                Button("Save") {
                    self.addImage()
                    self.screen = 0
                }
            }
            .padding()
            Spacer()
        }
        
    }
    
    func addImage() {
        guard var inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        guard let image = image else {
            return
        }
        pictures.items.append(Picture(image: image, name: name))
        
    }
}

//struct AddNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNameView(name: "Example")
//    }
//}
