//
//  AddressView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 21.08.2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var vm: CartViewModel
    @State private var isShowProfileView = false
    @Namespace private var namespace
    var body: some View {
        if vm.person != nil {
            ScrollView(.horizontal) {
                    HStack {
                        ForEach(vm.address, id:\.addres) { item in
                            VStack(alignment: .leading) {
                                Text("Address")
                                    .font(.title)
                                    .bold()
                                Text(item.city)
                                    .font(.title3)
                                Text(item.addres)
                                    .font(.title3)
                                Text(item.home)
                                    .font(.title3)
                            }
                            .foregroundColor(.black)
                            .padding()
                            .frame(height: 180)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color("AddressItemColor"))
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
            }
        } else {
            VStack(alignment: .center) {
                Text("No address, create account please")
                    .foregroundColor(.black)
                Image(systemName: "plus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.3)
                    .foregroundColor(.blue)
            }
            .padding()
            .frame(height: 180)
            .frame(maxWidth: .infinity)
            .background(Color("AddressItemColor"))
            .cornerRadius(20)
            .padding(.horizontal)
            .fullScreenCover(isPresented: $isShowProfileView, content: {
                DetailPersonView(isShow: $isShowProfileView, namespace: namespace)
            })
            .onTapGesture {
                isShowProfileView.toggle()
                
            }
        }
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(vm: CartViewModel())
    }
}
