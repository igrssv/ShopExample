//
//  CartViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [Product] = []
    
   
    func fetch() {
        self.products = StorageManager.shared.loadProduct()
    }
    
    func del() {
        StorageManager.shared.deleteProduct()
        self.products = StorageManager.shared.loadProduct()
    }
}
