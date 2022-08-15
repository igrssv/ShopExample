//
//  ProductsListView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 10.08.2022.
//

import SwiftUI

struct ProductsListView: View {
    @ObservedObject var vm: ShopboardViewModel
    
    
    let gridItems = [
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20),
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20)
    ]
    var body: some View {
        if !vm.isLoad {
            VStack {
                ZStack {
                    LazyVGrid(columns: gridItems) {
                        ForEach(vm.products, id:\.id) { product in
                            ItemProductView(vm: ItemViewModel(product: product))
                        }
                    }
                    .padding()
                }
            }
        } else {
            ProgressView()
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(vm: ShopboardViewModel(category: ""))
    }
}
