//
//  ProfileView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 01.08.2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileViewModel()
    var body: some View {
        if vm.person {
            VStack {
                HStack(spacing: 30) {
                    Image("nike")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .scaleEffect(1)
                        .frame(width: 60, height: 60, alignment: .leading)
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
                    Button(action: {}, label: {
                        Text("Create account")
                            .font(.title3)
                            .frame(height: 40)
                            .frame(width: UIScreen.main.bounds.width * 0.6, alignment: .center)
                            .foregroundColor(.white)
                    })
                    .background(.green)
                    .cornerRadius(10)
                        
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
