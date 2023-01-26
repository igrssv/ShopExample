//
//  CartItemView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 17.08.2022.
//

import SwiftUI

struct CartItemView: View {
    @StateObject var vm: CartItemViewModel
    var body: some View {
        HStack {
            ImageView(vm: ImageViewModel(imageURL: vm.image))
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 110)
                .padding(10)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("BGImage"))
                        .shadow(color: .gray, radius: 4)
                )
            VStack {
                Text(vm.titel)
                    .bold()
                    .minimumScaleFactor(0.7)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity, alignment:  .leading)
                HStack {
                    Text("1x \(String(format: "%.2f",vm.price)) $")
                        .italic()
                    Spacer()
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .overlay {
                                Text("+")
                                    .foregroundColor(.black)
                            }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .overlay {
                                Text("-")
                                    .foregroundColor(.black)
                            }
                    }
                }
            }
        }
        .padding()
        .frame(height: 160)
        .frame(maxWidth: .infinity)
        .background(Color("cartItemColor"))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(vm: CartItemViewModel(image: "newBalance", titel: "New Balance cross", price: 200))
    }
}
