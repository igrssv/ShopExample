//
//  CartGoodsView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import SwiftUI

struct CartGoodsView: View {
    @StateObject var vm: CartViewModel
    @Binding var selectedTab: String
    @Binding var isShow: Bool
    var body: some View {
        VStack {
            HStack {
                Text("Cart")
                    .font(.largeTitle)
                    .bold()
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
            }
            .padding()
            CartRowView(vm: vm)
            Divider()
            FinalPriceView(finalPrice: $vm.finalPrice)
            if vm.person != nil {
                NavigationLink(destination: CheckoutView(vm: CheckoutViewModel(cartVM: vm), selectedTab: $selectedTab), isActive: $isShow) {
                    Text("Checkout")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .frame(height: 30)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding([.horizontal, .bottom])
                }
            } else {
                Text("Checkout")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .frame(height: 30)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding([.horizontal, .bottom])
                    .onTapGesture {
                        selectedTab = "Profile"
                    }
            }
            
        }
    }
}
struct CartGoodsView_Previews: PreviewProvider {
    static var previews: some View {
        CartGoodsView(vm: CartViewModel(), selectedTab: .constant(""), isShow: .constant(true))
    }
}
