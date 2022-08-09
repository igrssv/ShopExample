//
//  TextFieldCreateView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import SwiftUI

struct TextFieldCreateView: View {
    @Binding var text: String
    let titel: String
    let plaseholder: String
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(titel)
                .padding(.leading)
            TextField(plaseholder, text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}
struct TextFieldCreateView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldCreateView(text: .constant(""), titel: "Your name:", plaseholder: "Tony")
    }
}
