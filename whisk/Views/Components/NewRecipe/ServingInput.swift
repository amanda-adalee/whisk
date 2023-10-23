//
//  ServingInput.swift
//  whisk
//
//  Created by Amanda Arreola on 10/23/23.
//

import Foundation
import SwiftUI

struct ServingsInput: View{
    
    @Binding var servings: Int
    
    var body: some View {
        Section(header: Text("servings")) {
            Stepper("number of servings: \(servings)", value: $servings, in: 0...100)
                .foregroundColor(.gray)

        }
    }
    
}
