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
                CartRowView(vm: vm)
                    .navigationTitle("Cart")
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(selectedTab: .constant("Cart"))
    }
}
