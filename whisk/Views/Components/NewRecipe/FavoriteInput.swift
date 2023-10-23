//
//  FavoriteInput.swift
//  whisk
//
//  Created by Amanda Arreola on 10/23/23.
//

import Foundation

import SwiftUI

struct FavoriteInput: View{
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        Section(header: Text("favorite")) {
            Toggle("favorite this recipe", isOn: $isFavorite)
                .toggleStyle(BlackToggleStyle())
        }
    }
    
}
