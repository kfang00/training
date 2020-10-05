//
//  ContentView.swift
//  Instafilter
//
//  Created by Kayla Fang on 10/4/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins



struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingFilterSheet = false

    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var selectedFilter = "Change Filter"
    @State private var filterInputKey = "Intensity"
    let context = CIContext()
    @State private var processedImage: UIImage?
    @State private var showAlert = false


    var body: some View {
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)

                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }

                HStack {
                    Text("\(self.filterInputKey)")
                    Slider(value: intensity)
                }.padding(.vertical)

                HStack {
                    Button("\(self.selectedFilter)") {
                        self.showingFilterSheet = true
                    }

                    Spacer()

                    Button("Save") {
                        guard let processedImage = self.processedImage else {
                            self.showAlert = true
                            return }

                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                        }

                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("ERROR"), message: Text("No picture selected"), dismissButton: .default(Text("Ok")))
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(title: Text("Select a filter"), buttons: [
                    .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize())
                        self.selectedFilter = "Crystallize"
                    },
                    .default(Text("Edges")) { self.setFilter(CIFilter.edges())
                        self.selectedFilter = "Edges"
                    },
                    .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur())
                        self.selectedFilter = "Gaussian Blur"
                    },
                    .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate())
                        self.selectedFilter = "Pixellate"
                    },
                    .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone())
                        self.selectedFilter = "Sepia Tone"
                    },
                    .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask())
                        self.selectedFilter = "Unsharp Mask"
                    },
                    .default(Text("Vignette")) { self.setFilter(CIFilter.vignette())
                        self.selectedFilter = "Vignette"},
                    .cancel()
                ])
            }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }

        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
            filterInputKey = "Intensity"
        }
            
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
            filterInputKey = "Radius"
        }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
            filterInputKey = "Scale"
        }
        //currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)

        //currentFilter.intensity = Float(filterIntensity)

        guard let outputImage = currentFilter.outputImage else { return }

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
