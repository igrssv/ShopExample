//
//  DetailPersonView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 27.08.2022.
//

import SwiftUI

struct DetailPersonView: View {
    @StateObject var vm = ProfileViewModel()
    @Binding var isShow: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(spacing: 20) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .clipShape(Circle())
                            .matchedGeometryEffect(id: "personImage", in: namespace)
                        Text("Tony Stark")
                            .font(.largeTitle)
                            .bold()
                            .minimumScaleFactor(0.6)
                            .matchedGeometryEffect(id: "personName", in: namespace)
                        Spacer()
                    }
                    Text("Edit profile")
                        .font(.subheadline)
                        .italic()
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                PersonListView(vm: vm)
            }
            CloseView()
                .onTapGesture {
                    withAnimation {
                        isShow.toggle()
                    }
                }
        }
    }
}

struct DetailPersonView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        DetailPersonView(isShow: .constant(true), namespace: namespace)
    }
}

struct PersonListView: View {
    @ObservedObject var vm: ProfileViewModel
    var body: some View {
        VStack {
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
