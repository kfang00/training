//
//  ContentView.swift
//  BucketList
//
//  Created by Kayla Fang on 10/6/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}


struct ContentView: View {
    
    enum LoadingState {
        case loading, success, failed
    }

    var loadingState = LoadingState.loading

    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
//        Group {
//            if loadingState == .loading {
//                LoadingView()
//            } else if loadingState == .success {
//                SuccessView()
//            } else if loadingState == .failed {
//                FailedView()
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
