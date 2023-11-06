//  Created by Amanda Arreola on 10/23/23.

import Foundation
import SwiftUI

struct CookTimeInput: View {
    
    @Binding var cooktime: Int
    
    var body: some View {
        Section(header: Text("cook time")) {
            Picker("cook time", selection: $cooktime) {
                ForEach(Array(stride(from: 0, to: 601, by: 5)), id: \.self) { minute in
                    Text("\(minute) mins")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 100)
            .clipped()
            .foregroundColor(.gray)
        }
    }
}

// preview
struct CookTimeInput_Previews: PreviewProvider {
    @State static var cookTime: Int = 0
    
    static var previews: some View {
            Form {
                CookTimeInput(cooktime: $cookTime)
            }
    }
}
