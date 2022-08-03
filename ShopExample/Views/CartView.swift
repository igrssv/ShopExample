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
    var body: some View {
        NavigationView {
            if vm.products.isEmpty {
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
                .navigationTitle("Cart")
            } else {
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
                CartRowView(vm: vm)
                    .navigationTitle("Cart")
                    Divider()
                    HStack {
                        Text("Final price:")
                        Spacer()
                        Text(String(format: "%.2f", vm.finalPrice) + " $")
                    }
                    .font(.title)
                    .minimumScaleFactor(0.7)
                    .frame(height: 40)
                    .padding(.horizontal)
                    Button(action: {}) {
                        Text("Checkout")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .frame(height: 30)
                    }
                    .background(.blue)
                    .cornerRadius(10)
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .onAppear {
            vm.fetch()
        }
        .animation(.default, value: vm.finalPrice)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(selectedTab: .constant("Cart"))
    }
}
