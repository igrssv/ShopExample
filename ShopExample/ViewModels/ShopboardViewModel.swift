//
//  MainViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import Foundation

class ShopboardViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var blocks: [Block] = Block.createSampleBlocks()
    
    init() {
        fetch()
    }
    func fetch() {
        NetworkManager.shared.fetchProducts { products in
            self.products = products
            print(products.count)
        }
    }
}
