//
//  CartView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import SwiftUI

struct CartView: View {
    @State private var goMainView = false
    @ObservedObject var vm = CartViewModel()
    @Binding var selectedTab: String
    var body: some View {
        NavigationView {
            if vm.products.isEmpty {
                VStack {
                    Image(systemName: "cart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
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
                    .sheet(isPresented: $goMainView) {
                        ShopboardView()
                    }
                }
            } else {
                VStack {
                    Button(action: {
                        vm.fetch()
                    }) {
                        Text("fetch")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                    Button(action: {
                        vm.del()
                    }) {
                        Text("del")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    ScrollView {
                        ForEach(vm.products, id:\.id) { item in
                            HStack {
                                ImageView(vm: ImageViewModel(imageURL: item.image))
                                    .frame(width: 100, height: 100)
                                Text(item.title)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Cart")
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
