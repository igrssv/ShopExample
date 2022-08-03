//
//  Delivery.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import Foundation

struct Delivery: Encodable, Decodable {
    let person: Person
    let products: [Product]
    let status: StatusDelivery
    
}

enum StatusDelivery: Encodable, Decodable {
    case created
    case buildStarted
    case assembled
    case shippedFromWarehouse
    case courier
    case ready
}

