//
//  Category.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 10.08.2022.
//

import Foundation

struct Category: Codable {
    var id = UUID()
    var titel: String
    var image: String
}
