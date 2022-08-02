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
        VStack {
            if vm.person != nil {
                AuthorizedUserView(vm: vm)
            } else {
                NoAuthorizedUserView(vm: vm, isShow:  $isShow)
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
                ButtonCartView(titel: "Delivery")
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

struct NoAuthorizedUserView: View {
    @ObservedObject var vm: ProfileViewModel
    @Binding var isShow: Bool
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image("nouser")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Text("Don't have an account?")
                Text("Let's create!")
                Button(action: {vm.showCreateCiew()}, label: {
                    Text("Create account")
                        .font(.title3)
                        .frame(height: 40)
                        .frame(width: UIScreen.main.bounds.width * 0.6, alignment: .center)
                        .foregroundColor(.white)
                })
                .background(.green)
                .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $vm.isShow) {
                CreatePersonView(vm: CreatePersonViewModel(profileVM: vm))
            }
            Spacer()
            Button(action: {}) {
                Text("About the application")
            }
            .padding(.bottom)
        }
    }
}
