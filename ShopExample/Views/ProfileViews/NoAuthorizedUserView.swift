//
//  NoAuthorizedUserView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import SwiftUI

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
                NavigationLink {
                    CreatePersonView(vm: CreatePersonViewModel(profileVM: vm))
                } label: {
                    Text("Create account")
                        .font(.title3)
                        .frame(height: 40)
                        .frame(width: UIScreen.main.bounds.width * 0.6, alignment: .center)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(10)
                }
            }
            Spacer()
            Button(action: {}) {
                Text("About the application")
            }
            .padding(.bottom)
        }
    }
}

struct NoAuthorizedUserView_Previews: PreviewProvider {
    static var previews: some View {
        NoAuthorizedUserView(vm: ProfileViewModel(), isShow: .constant(false))
    }
}
