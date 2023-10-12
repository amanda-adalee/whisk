//
//  CustomCategoryPicker.swift
//  whisk
//
//  Created by Amanda Arreola on 10/12/23.
//

import SwiftUI

struct CustomCategoryPicker: View {
    @Binding var selectedCategory: Category
    var categories: [Category] = Category.allCases
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: -20) {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        self.selectedCategory = category
                    }) {
                        ZStack(alignment: .bottom) {
                            Text(category.rawValue.capitalized)
                                .padding(.horizontal)
                                .foregroundColor(
                                    selectedCategory == category ? Color.black : Color.gray
                                )

                            if selectedCategory == category {
                                Rectangle()
                                    .frame(width: 5, height: 3)
                                    .foregroundColor(Color.black)
                                    .offset(y: 5)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CustomCategoryPicker(selectedCategory: .constant(Category.all))
}
