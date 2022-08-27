//
//  CreateProfileView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 27.08.2022.
//

import SwiftUI

struct CreateProfileView: View {
    @State private var text = ""
    @State private var nextView = false
    var body: some View {
        
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    Spacer(minLength: 50)
                    TextFieldCreateView(text: $text, titel: "Your name:", plaseholder: "Tony")
                    TextFieldCreateView(text: $text, titel: "Your surname:", plaseholder: "Stark")
                    TextFieldCreateView(text: $text, titel: "Your phone:", plaseholder: "999999293")
                    TextFieldCreateView(text: $text, titel: "Your mail:", plaseholder: "ironman@stark.com")
                    TextFieldCreateView(text: $text, titel: "Your Country:", plaseholder: "USA")
                    TextFieldCreateView(text: $text, titel: "Your city", plaseholder: "New York")
                    TextFieldCreateView(text: $text, titel: "Your street", plaseholder: "Wall St.")
                    TextFieldCreateView(text: $text, titel: "Your home", plaseholder: "1")
                    ButtonCartView(titel: "Let's go shopping")
                }
                .padding(.bottom)
            }
            CloseView()
        }
        
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
