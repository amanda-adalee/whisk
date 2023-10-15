//
//  RecipeInfoBox.swift
//  whisk
//
//  Created by Amanda Arreola on 10/14/23.
//

import SwiftUI

struct RecipeInfoBox: View {
    var label: String
    var value: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 80, height: 30)
                .foregroundColor(.white)

            VStack {
                Text(label)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Text(value)
                    .font(.caption)
                    .foregroundColor(.black)
            }
        }
    }
}

struct InfoBox_Previews: PreviewProvider {
    static var previews: some View {
        RecipeInfoBox(label: "Category", value: "Breakfast")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

