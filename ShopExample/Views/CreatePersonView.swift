//
//  CreatePersonView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 01.08.2022.
//

import SwiftUI

struct CreatePersonView: View {
    @ObservedObject var vm: CreatePersonViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Hello\(vm.name.isEmpty ? "" : ",")")
                Text(vm.name.uppercased())
            }
            .font(.title)
            .frame(height: UIScreen.main.bounds.height * 0.13)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            ScrollView {
                VStack {
                    TextFieldCreateView(text: $vm.name, titel: "Your name:", plaseholder: "Jonny")
                    TextFieldCreateView(text: $vm.lastName, titel: "Your last name:", plaseholder: "Cage")
                    TextFieldCreateView(text: $vm.phone, titel: "Phone:", plaseholder: "+7999999999")
                    TextFieldCreateView(text: $vm.email, titel: "Email:", plaseholder: "JonnyCage@gmail.com")
                    TextFieldCreateView(text: $vm.city, titel: "City:", plaseholder: "New York")
                    TextFieldCreateView(text: $vm.addres, titel: "Addres:", plaseholder: "62-10 Northern Blvd")
                    ButtonCartView(titel: "Let's go")
                        .onTapGesture {
                            vm.savePerson()
                        }
                }
            }
            
                
        }
        .animation(.default, value: vm.name)
    }
}

struct CreatePersonView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePersonView(vm: CreatePersonViewModel(profileVM: ProfileViewModel()))
    }
}

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
