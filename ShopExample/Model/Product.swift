//
//  Product.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import Foundation

struct Product: Encodable, Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}

extension Product {
    static func fetchOneProduct() -> Product {
        let product = Product(id: 1, title: "New Balance", price: 139.0, description: "One more...", category: "cross", image: "nb")
        return product
}


}
