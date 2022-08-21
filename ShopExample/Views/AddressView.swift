//
//  AddressView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 21.08.2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var vm: CartViewModel
    var body: some View {
        
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
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(vm: CartViewModel())
    }
}
