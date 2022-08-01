//
//  CartRowView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import SwiftUI

struct CartRowView: View {
    @ObservedObject var vm: CartViewModel
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    vm.clearCart()
                }) {
                    Text("Clear cart")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width * 0.3 ,height: 30)
                }
                .background(.red)
                .cornerRadius(10)
                .padding(.trailing)
            }
            List {
                ForEach(vm.products, id:\.id) { product in
                    HStack {
                        ImageView(vm: ImageViewModel(imageURL: product.image))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .scale(1.1)
                                    .foregroundColor(Color("BGImage"))
                            )
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.title3)
                                .minimumScaleFactor(0.8)
                            Text(String(format: "%.2f", product.price) + " $")
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 100)
                }.onDelete { indexSet in
                    vm.deleteProduct(index: indexSet)
                }
            }
        }
    }
}

struct CartRow_Previews: PreviewProvider {
    static var previews: some View {
        CartRowView(vm: CartViewModel())
    }
}
