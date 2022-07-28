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



