//
//  ProductViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 30.07.2022.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var product: Product
    @Published var currentProducttoCart = ""
    
    init(product: Product) {
        self.product = product
    }
    
    func buyProduct() {
        StorageManager.shared.saveProduct(product: self.product)
        currentProducttoCart = String(StorageManager.shared.loadProduct().filter({$0.id == product.id}).count)
        print(currentProducttoCart)
    }
}
