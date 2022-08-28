//
//  PersonView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.08.2022.
//

import SwiftUI

struct PersonView: View {
    @EnvironmentObject var vm: ProfileViewModel
    @Binding var isShowProfile: Bool
    var namespace: Namespace.ID
    var body: some View {
        HStack {
            HStack {
                Text(vm.person?.name ?? "Create")
                    .bold()
                Text(vm.person?.lastName ?? "Account")
                    .bold()
            }
            .font(.largeTitle)
            .minimumScaleFactor(0.6)
            .matchedGeometryEffect(id: "personName", in: namespace)
            Spacer()
            Image(systemName: vm.person != nil ? "person.circle" : "person.crop.circle.badge.plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(vm.person != nil ? 1 : 0.7)
                .frame(width: vm.person != nil ? 30 : 40)
                .clipShape(Circle())
                .matchedGeometryEffect(id: "personImage", in: namespace)
                .onTapGesture {
                    withAnimation {
                        isShowProfile.toggle()
                    }
                }
        }
        .padding()
    }
}

struct PersonView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PersonView(isShowProfile: .constant(true), namespace: namespace)
            .environmentObject(ProfileViewModel())
    }
}
