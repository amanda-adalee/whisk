//  Created by Amanda Arreola on 10/23/23.

import Foundation
import SwiftUI

struct ListInput: View {
    var headerTitle: String
    @Binding var items: [String]
    @Binding var newItem: String
    
    var body: some View {
        Section(header: Text(headerTitle)) {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: { offsets in
                    items.remove(atOffsets: offsets)
                })
            }
            
            HStack {
                TextField("add one \(headerTitle.singularized()) at a time", text: $newItem)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(radius: 4, x: 2, y: 2)
                    )
                
                Button("+") {
                    if !newItem.isEmpty {
                        items.append(newItem)
                        newItem = ""
                    }
                }
            }
        }
    }
}

extension String {
    func singularized() -> String {
        return self
    }
}

// preview
struct ListInput_Previews: PreviewProvider {

    @State static var items: [String] = ["milk", "eggs", "bread", "sugar"]
    @State static var newItem: String = ""

    static var previews: some View {
        Form {
            ListInput(headerTitle: "ingredients", items: $items, newItem: $newItem)
        }
    }
}
