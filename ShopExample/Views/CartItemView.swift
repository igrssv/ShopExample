//
//  CartItemView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 17.08.2022.
//

import SwiftUI

struct CartItemView: View {
    var body: some View {
        HStack {
            ImageView(vm: ImageViewModel(imageURL: "vm.product.image"))
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 120)
                .padding(10)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("BGImage"))
                        .shadow(color: .gray, radius: 4)
                )
            VStack {
                Text("New Balance cross")
                    .bold()
                    .minimumScaleFactor(0.7)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity, alignment:  .leading)
                HStack {
                    Text("1x 199 $")
                        .italic()
                    Spacer()
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .overlay {
                                Text("+")
                            }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .overlay {
                                Text("-")
                            }
                    }
                }
            }
        }.padding()
        .frame(height: 180)
        .frame(maxWidth: .infinity)
        .background(Color("cartItemColor"))
        .cornerRadius(20)
        .padding()
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView()
    }
}
