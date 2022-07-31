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
            List {
                ForEach(vm.products, id:\.id) { product in
                    HStack {
                        ImageView(vm: ImageViewModel(imageURL: product.image))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .scale(1.1)
                                    .foregroundColor(Color("BGImage"))
                            )
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.title3)
                                .minimumScaleFactor(0.8)
                            Text(String(product.price) + " $")
                            Spacer()
                            HStack {
                                Text("Count: ")
                                Text("1")
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        
                    }
                    .frame(height: 100)
                }.onDelete { item in
                    vm.del()
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
