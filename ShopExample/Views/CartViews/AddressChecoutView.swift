//
//  AddressChecoutView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import SwiftUI

struct AddressChecoutView: View {
    @StateObject var vm: CheckoutViewModel
    var body: some View {
        VStack {
            Text("Addres:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(vm.address, id:\.addres, content: { addres in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke()
                            )
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text(addres.city)
                                        .font(.title2)
                                        .bold()
                                    Text("Addres:")
                                        .font(.subheadline)
                                        .bold()
                                    Text(addres.addres)
                                        .font(.subheadline)
                                        .minimumScaleFactor(0.6)
                                }
                                    .foregroundColor(.black)
                                    .padding(10)
                            )
                    })
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        )
                        .overlay(
                            Image(systemName: "plus.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.4)
                        )
                }
                .padding(.horizontal)
                
            }
            
        }
    }
}

struct AddressChecoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddressChecoutView(vm: CheckoutViewModel(cartVM: CartViewModel()))
    }
}
