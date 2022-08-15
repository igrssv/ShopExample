//
//  Shopboard.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct ShopboardView: View {
//    @StateObject private var vm = ShopboardViewModel()
    @StateObject private var vm = ShopboardViewModel(category: "")

    let gridItems = [
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20),
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20)
    ]
    var body: some View {
        NavigationView {
            VStack {
                SearchOldView(vm: vm)
                ScrollView {
                    VStack {
                        BlockView(blocks: $vm.blocks)
                        LazyVGrid(columns: gridItems) {
                            ForEach(vm.products, id:\.id) { item in
                                ItemView(vm: ItemViewModel(product: item))
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        
    }
}

struct ShopboardView_Previews: PreviewProvider {
    static var previews: some View {
        ShopboardView()
    }
}
