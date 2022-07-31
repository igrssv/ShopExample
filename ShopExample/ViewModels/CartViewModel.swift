//
//  CartViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [Product] = []
    let product = [Product.fetchOneProduct(), Product.fetchOneProduct(), Product.fetchOneProduct(), Product.fetchOneProduct()]
    
   
    func fetch() {
        self.products = StorageManager.shared.loadProduct()
    }
    
    func deleteProduct(index: IndexSet) {
        StorageManager.shared.deleteProduct(index: index)
        self.products = StorageManager.shared.loadProduct()
    }
}
