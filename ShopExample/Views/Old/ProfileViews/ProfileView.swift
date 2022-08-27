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
        NavigationView {
            VStack {
                if vm.person == nil {
                    AuthorizedUserView(vm: vm)
                } else {
                    NoAuthorizedUserView(vm: vm, isShow:  $isShow)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}

struct AuthorizedUserView: View {
    @ObservedObject var vm: ProfileViewModel
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .leading)
                    .clipShape(Circle())
                    .overlay(Circle().stroke())
                HStack {
                    Text(vm.person?.name ?? "No ")
                        .font(.largeTitle)
                        .minimumScaleFactor(0.7)
                    Text(vm.person?.lastName ?? "Name")
                        .font(.largeTitle)
                        .minimumScaleFactor(0.7)
                }
            }
            .frame(height: UIScreen.main.bounds.width * 0.3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            Divider()
            ScrollView(showsIndicators: false) {
                ButtonCartView(titel: "Orders")
                NavigationLink {
                    DeliveryView()
                } label: {
                    ButtonCartView(titel: "Delivery")
                }
                ButtonCartView(titel: "Address")
                ButtonCartView(titel: "Complain")
                ButtonCartView(titel: "About the application")
                ButtonCartView(titel: "Exit")
                    .onTapGesture {
                        vm.clearPerson()
                    }
            }
            .padding(.top)
        }
        .padding(.bottom)
    }
}


