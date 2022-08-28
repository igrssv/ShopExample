//
//  CreateProfileView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 27.08.2022.
//

import SwiftUI

struct CreateProfileView: View {
    @State private var text = ""
    @Binding var isShowRegestation: Bool
    @ObservedObject var vm: CreatePersonViewModel
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    Spacer(minLength: 50)
                    TextFieldCreateView(text: $vm.name, titel: "Your name:", plaseholder: "Tony")
                    TextFieldCreateView(text: $vm.lastName, titel: "Your surname:", plaseholder: "Stark")
                    TextFieldCreateView(text: $vm.phone, titel: "Your phone:", plaseholder: "999999293")
                    TextFieldCreateView(text: $vm.email, titel: "Your email:", plaseholder: "ironman@stark.com")
                    TextFieldCreateView(text: $text, titel: "Your Country:", plaseholder: "USA")
                    TextFieldCreateView(text: $vm.city, titel: "Your city", plaseholder: "New York")
                    TextFieldCreateView(text: $vm.addres, titel: "Your street", plaseholder: "Wall St.")
                    TextFieldCreateView(text: $vm.home, titel: "Your home", plaseholder: "1")
                    ButtonCartView(titel: "Let's go shopping")
                        .onTapGesture {
                            vm.save()
                            isShowRegestation.toggle()
                        }
                }
                .padding(.bottom)
            }
            CloseView()
                .onTapGesture {
                    withAnimation {
                        isShowRegestation.toggle()
                    }
                }
        }
        
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(isShowRegestation: .constant(true), vm: CreatePersonViewModel(profileVM: ProfileViewModel()))
    }
}
