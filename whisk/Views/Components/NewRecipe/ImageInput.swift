//
//  ImageInput.swift
//  whisk
//
//  Created by Amanda Arreola on 10/23/23.
//

import Foundation
import SwiftUI

struct ImageInput: View{
    
    @Binding var image: UIImage?
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View{
        Section(header: Text("image")) {
            if let unwrappedImage = image {
                Image(uiImage: unwrappedImage)
                    .resizable()
                    .scaledToFit()
                
                Button("delete image") {
                    self.image = nil
                }
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                        .shadow(radius: 4, x: 2, y: 2)
                    
                    Button("tap to add a recipe image") {
                        isImagePickerPresented = true
                    }
                    .foregroundColor(.gray)
                }
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $image)
        }
    }
}
