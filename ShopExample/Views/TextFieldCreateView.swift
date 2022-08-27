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
                .padding(.leading, 10)
                .foregroundColor(Color("textColor").opacity(0.8))
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(plaseholder)
                        .font(.system(.subheadline, design: .default))
                        .foregroundColor(Color("textColor").opacity(0.5))
                }
                TextField(text: $text) {
                    Text("")
                        .font(.system(.subheadline, design: .default))
                }
                .foregroundColor(Color("textColor"))
                .cornerRadius(20)
                .padding(5)
                
            }
            .padding(.horizontal, 10)
            .background(.white)
            .cornerRadius(20)
            .frame(maxWidth: .infinity)
            
        }
        .padding(10)
        .background(.yellow)
        .cornerRadius(20)
        .padding()
        
        
    }
}
struct TextFieldCreateView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldCreateView(text: .constant(""), titel: "Your name:", plaseholder: "Tony")
    }
}
