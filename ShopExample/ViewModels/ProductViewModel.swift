//
//  ProductViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 30.07.2022.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
    }
}
