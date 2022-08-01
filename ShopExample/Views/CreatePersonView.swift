//
//  CreatePersonView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 01.08.2022.
//

import SwiftUI

struct CreatePersonView: View {
    @State private var name = ""
    @State private var lastName = ""
    @State private var phone = ""
    @State private var email = ""
    var body: some View {
        VStack {
            HStack {
                Text("Hello\(name.isEmpty ? "" : ",")")
                Text(name.uppercased())
            }
            .font(.title)
            .frame(height: UIScreen.main.bounds.height * 0.2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            TextField("You name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("You last name", text: $lastName)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("You phone", text: $phone)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("You e-mail ", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()
            Spacer()
            ButtonCartView(titel: "Let's go")
                
        }
        .animation(.default, value: name)
    }
}

struct CreatePersonView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePersonView()
            
    }
}
