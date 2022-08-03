//
//  CartView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var vm = CartViewModel()
    @Binding var selectedTab: String
    @State private var isShow = false
    var body: some View {
        NavigationView {
            VStack {
                if vm.products.isEmpty {
                    NoCartGoodsView(selectedTab: $selectedTab)
                } else {
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
                        NavigationLink(destination: CheckoutView(vm: CheckoutViewModel(cartVM: vm)), isActive: $isShow) {
                            Text("Checkout")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .frame(height: 30)
                                .background(.blue)
                                .cornerRadius(10)
                                .padding([.horizontal, .bottom])
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                vm.fetch()
            }
        .animation(.default, value: vm.finalPrice)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(selectedTab: .constant("Cart"))
    }
}

struct NoCartGoodsView: View {
    @Binding var selectedTab: String
    var body: some View {
        VStack {
            Image(systemName: "cart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("Cart is empty.")
            Button(action: {selectedTab = "Main"}) {
                Text("Go shopping!")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .background(.blue)
            .buttonStyle(.bordered)
            .cornerRadius(20)
        }
    }
}

struct FinalPriceView: View {
    @Binding var finalPrice: Double
    var body: some View {
        HStack {
            Text("Final price:")
            Spacer()
            Text(String(format: "%.2f", finalPrice) + " $")
        }
        .font(.title)
        .minimumScaleFactor(0.7)
        .frame(height: 40)
        .padding(.horizontal)
    }
}
