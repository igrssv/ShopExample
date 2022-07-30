//
//  Shopboard.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct ShopboardView: View {
    @StateObject private var vm = ShopboardViewModel()
    let gridItems = [
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20),
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20)
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    BlockView(blocks: $vm.blocks)
                    LazyVGrid(columns: gridItems) {
                        ForEach(vm.products, id:\.id) { item in
                            ItemView(vm: ImageViewModel(product: item))
                        }
                    }
                    .padding()
                }
                .navigationTitle("My Shop")
            }
        }
        
    }
}

struct ShopboardView_Previews: PreviewProvider {
    static var previews: some View {
        ShopboardView()
    }
}
