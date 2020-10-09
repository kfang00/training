//
//  DetailView.swift
//  PicChallenge
//
//  Created by Kayla Fang on 10/8/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let image: Picture
    var body: some View {
        GeometryReader {geo in
            VStack {
                Text(self.image.name)
                    .font(.title)
                    .bold()
                self.image.image
                .resizable()
                .scaledToFit()
                    .frame(width: geo.size.width)
            }
            Spacer()
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
