//
//  Delivery.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import Foundation

struct Delivery: Encodable, Decodable {
    var id = UUID()
    let person: Person
    let products: [Product]
    let address: Address
    var status: StatusDelivery
    let date: Date
}

enum StatusDelivery: String, Encodable, Decodable {
    case created = "Created"
    case buildStarted = "Build Started"
    case assembled = "Assembled"
    case shippedFromWarehouse = "Shipped from ware house"
    case courier = "Courier"
    case ready = "Ready"
}

