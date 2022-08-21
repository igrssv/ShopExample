//
//  CartView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 21.08.2022.
//

import SwiftUI

struct CartView: View {
    @StateObject var vm = CartViewModel()
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(0 ..< 5) { item in
                            CartItemView()
                        }
                        
                    }
                }
            }
            .navigationTitle("Cart")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(height: 10)
                        .padding(10)
                        .background(Color("ToolBarButton"))
                        .clipShape(Circle())
                        .padding(.bottom)
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .preferredColorScheme(.light)
    }
}
