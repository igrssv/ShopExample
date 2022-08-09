//
//  AddAddressView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import SwiftUI

struct AddAddressView: View {
    @StateObject var vm: CreatePersonViewModel
    var body: some View {
        VStack {
            VStack {
                TextFieldCreateView(text: $vm.city, titel: "City:", plaseholder: "New York")
                TextFieldCreateView(text: $vm.addres, titel: "Street:", plaseholder: "Northern Blvd")
                TextFieldCreateView(text: $vm.home, titel: "Home:", plaseholder: "43 - 2")
                Spacer()
                ButtonCartView(titel: "Let's go to shoppng")
                    .onTapGesture {
                        vm.save()
                    }
            }
        }
        .padding([.top, .bottom])
    }
}

struct AddAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddAddressView(vm: CreatePersonViewModel(profileVM: ProfileViewModel()))
    }
}
