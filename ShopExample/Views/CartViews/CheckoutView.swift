//
//  CheckoutView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import SwiftUI

struct CheckoutView: View {
    @StateObject var vm: CheckoutViewModel
    @Environment(\.presentationMode) var presentation
    
    @Binding var selectedTab: String
    var body: some View {
        HStack {
            VStack {
                if vm.cartVM.person != nil {
                        VStack {
                            HStack {
                                Text("Checkout")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            ScrollView {
                                VStack(spacing: 20) {
                                    HStack {
                                        Text("Purchase amount:")
                                        Spacer()
                                        Text(String(vm.cartVM.finalPrice))
                                        Text("$")
                                    }
                                    HStack {
                                        Text("Goods")
                                        Spacer()
                                        Text("\(vm.cartVM.products.count)")
                                    }
                                }
                                .font(.title2)
                                .padding()
                                AddressChecoutView(vm: vm)
                                    .padding(.horizontal)  
                            }
                            Spacer()
                            ButtonCartView(titel: "Pay orders")
                                .onTapGesture {
                                    vm.arrangeDelivery()
                                    self.presentation.wrappedValue.dismiss()
                                }
                        }
                    }
            }
        }.onAppear {
            if vm.cartVM.person == nil {
                selectedTab = "Cart"
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(vm: CheckoutViewModel(cartVM: CartViewModel()), selectedTab: .constant(""))
    }
}


