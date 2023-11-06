//  Created by Amanda Arreola on 10/23/23.

import SwiftUI

struct TextInput: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        Section(header: Text(title)) {
            TextField("recipe \(title.lowercased())", text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(radius: 4, x: 2, y: 2)
                )
        }
    }
}

// preview
struct TextInput_Previews: PreviewProvider {
    @State static var text: String = "example text"
    
    static var previews: some View {
            Form {
                TextInput(title: "text", text: $text)
            }
    }
}
