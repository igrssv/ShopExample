//
//  ProfileView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 01.08.2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileViewModel()
    @State private var isShow = false
    var body: some View {
        if (vm.person != nil) {
            VStack {
                HStack(spacing: 30) {
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100, alignment: .leading)
                        .clipShape(Circle())
                        .overlay(Circle().stroke())
                    Text("Adam Smit")
                        .font(.largeTitle)
                        .minimumScaleFactor(0.7)
                }
                .frame(height: UIScreen.main.bounds.width * 0.3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                Divider()
                ScrollView(showsIndicators: false) {
                    ButtonCartView(titel: "Orders")
                    ButtonCartView(titel: "Delivery")
                    ButtonCartView(titel: "Address")
                    ButtonCartView(titel: "Complain")
                    ButtonCartView(titel: "About the application")
                    ButtonCartView(titel: "Exit")
                }
                .padding(.top)
            }
            .padding(.bottom)
        } else {
            VStack {
                Spacer()
                VStack {
                    Text("Don't have an account?")
                    Text("Let's create!")
                    Button(action: {isShow.toggle()}, label: {
                        Text("Create account")
                            .font(.title3)
                            .frame(height: 40)
                            .frame(width: UIScreen.main.bounds.width * 0.6, alignment: .center)
                            .foregroundColor(.white)
                    })
                    .background(.green)
                    .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $isShow) {
                    CreatePersonView()
                }
                Spacer()
                ButtonCartView(titel: "About the application")
                    .padding(.bottom)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
