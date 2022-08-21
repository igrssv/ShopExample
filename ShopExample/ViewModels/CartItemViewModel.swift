//
//  CartItemViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 21.08.2022.
//

import Foundation

class CartItemViewModel: ObservableObject{
    let image: String
    let titel: String
    let price: Double
    
    init(image: String, titel: String, price: Double) {
        self.image = image
        self.titel = titel
        self.price = price
    }
}
