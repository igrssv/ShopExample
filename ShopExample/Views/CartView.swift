//
//  CartView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import SwiftUI

struct CartView: View {
    @State private var goMainView = false
    @Binding var selectedTab: String
    var body: some View {
        NavigationView {
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
            .navigationTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(selectedTab: .constant("Cart"))
    }
}
