//  Created by Amanda Arreola on 10/23/23.

import Foundation
import SwiftUI

struct CategoryInput: View {
    var categories: [Category]
    @Binding var selectedCategories: Set<Category>
    
    var body: some View {
        Section(header: Text("category")) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            if selectedCategories.contains(category) {
                                selectedCategories.remove(category)
                            } else {
                                selectedCategories.insert(category)
                            }
                        }) {
                            HStack {
                                if selectedCategories.contains(category) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.gray)
                                }
                                Text(category.rawValue)
                                    .fixedSize()
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(selectedCategories.contains(category) ? Color.black : Color.white)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                    }
                }
            }
        }
    }
}

// preview
struct CategoryInput_Previews: PreviewProvider {

    @State static var selectedCategories: Set<Category> = [Category.breakfast]

    static var previews: some View {
        Form {
            CategoryInput(categories: Array(Category.allCases.dropFirst()), selectedCategories: $selectedCategories)
        }
    }
}
