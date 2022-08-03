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
            VStack {
                TextFieldCreateView(text: $vm.name, titel: "Your name:", plaseholder: "Jonny")
                TextFieldCreateView(text: $vm.lastName, titel: "Your last name:", plaseholder: "Cage")
                TextFieldCreateView(text: $vm.phone, titel: "Phone:", plaseholder: "+7999999999")
                TextFieldCreateView(text: $vm.email, titel: "Email:", plaseholder: "JonnyCage@gmail.com")
                Spacer()
                NavigationLink {
                    AddAddressView(vm: vm)
                } label: {
                    ButtonCartView(titel: "Let's go")
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
