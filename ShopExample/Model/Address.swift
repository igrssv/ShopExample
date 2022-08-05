//
//  Address.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import Foundation

struct Address: Encodable, Decodable {
    let city: String
    let addres: String
    let home: String
}

extension Address {
    static func tempAddress() -> Address {
        let address = Address(city: "Moscow", addres: "Tveskaya", home: "33")
        return address
    }
}
