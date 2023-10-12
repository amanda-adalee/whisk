//
//  CategoryPicker.swift
//  whisk
//
//  Created by Amanda Arreola on 10/12/23.
//

import SwiftUI

struct CategoryPicker: View {
    @Binding var selectedCategory: Category
    
    var body: some View {
        Picker("Category", selection: $selectedCategory) {
            ForEach(Category.allCases, id: \.self) { category in
                Text(category.rawValue.capitalized)
                    .tag(category)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

#Preview {
    CategoryPicker(selectedCategory: .constant(Category.all))
}
