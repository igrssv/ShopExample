//
//  Product.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}

extension Product {
    static func fetchOneProduct() -> Product {
        let product = Product(id: 1, title: "test", price: 0.0, description: "", category: "", image: "soldout")
        return product
}


}
