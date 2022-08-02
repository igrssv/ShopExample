//
//  CartViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [Product] = [] {
        didSet {
            calculation()
        }
    }
    
    let product = [Product.fetchOneProduct(), Product.fetchOneProduct(), Product.fetchOneProduct(), Product.fetchOneProduct()]
    
    @Published var finalPrice: Double = 0
   
    func fetch() {
        var products: [Product] = []
        StorageManager.shared.load(key: .keyProduct) { (value: [Product]) in
            products = value
        }
        self.products = products
    }
    
    func deleteProduct(index: IndexSet) {
        StorageManager.shared.deleteProduct(index: index, key: .keyProduct)
        fetch()
    }
    
    func clearCart() {
        StorageManager.shared.clear(key: .keyProduct)
        fetch()
    }
    
    func calculation() {
        finalPrice = products.map({$0.price}).reduce(0, +)
    }
}
