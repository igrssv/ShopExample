//
//  CartView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 21.08.2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var vm: CartViewModel
    @Binding var show: Bool
    
    var body: some View {
        if !vm.products.isEmpty {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    VStack {
                        ScrollView {
                            //MARK: - titel page
                            HStack {
                                Text("Cart")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                            }
                            .padding()
                            VStack {
                                Text("Clear cart")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(.red.opacity(0.8))
                                    .cornerRadius(20)
                                    .onTapGesture {
                                        vm.clearCart()
                                    }
                                    .frame(maxWidth: .infinity, alignment:  .leading)
                                    .padding(.horizontal)
                                ForEach(vm.products, id:\.id) { item in
                                    CartItemView(vm: CartItemViewModel(image: item.image, titel: item.title, price: item.price))
                                }
                                
                            }
                            AddressView(vm: vm)
                        }
                    }
                    .padding(.bottom, 88)
                    //MARK: - close button
                    CloseView()
                        .onTapGesture {
                            show.toggle()
                        }
                }
                //MARK: - pay orders
                HStack {
                    Text("Pay orders")
                    Spacer()
                    Text(String(format: "%.2f", vm.finalPrice) + " $")
                }
                .padding()
                .foregroundColor(.white)
                .frame(height: 58)
                .frame(maxWidth: .infinity)
                .background(Color("buttonColor"))
                .cornerRadius(20)
                .padding()
                
            }
        } else {
            VStack {
                Text("You cart is empty!")
                Text("Go shopping")
                    .foregroundColor(.white)
                    .frame(height: 58)
                    .frame(maxWidth: .infinity)
                    .background(Color("buttonColor"))
                    .cornerRadius(20)
                    .padding()
                    .padding(.bottom, 10)
                    .onTapGesture {
                        show.toggle()
                    }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(show: .constant(true))
            .environmentObject(CartViewModel())
            .preferredColorScheme(.light)
    }
}


