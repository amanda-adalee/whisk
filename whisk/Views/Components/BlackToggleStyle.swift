//
//  BlackToggleStyle.swift
//  whisk
//
//  Created by Amanda Arreola on 10/13/23.
//

import SwiftUI

struct BlackToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .foregroundColor(.gray)
            
            Spacer()
            
            Rectangle()
                .fill(configuration.isOn ? Color.black : Color.gray)
                .frame(width: 50, height: 30, alignment: .center)
                .cornerRadius(15)
                .overlay(
                    Circle()
                        .fill(Color.white)
                        .padding(3)
                        .offset(x: configuration.isOn ? 12 : -12, y: 0)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct BlackToggleStylePreview: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        Toggle("test toggle", isOn: $isOn)
            .toggleStyle(BlackToggleStyle())
    }
}

#Preview {
    BlackToggleStylePreview()
}
