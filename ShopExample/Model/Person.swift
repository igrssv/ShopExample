//
//  Person.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 01.08.2022.
//

import Foundation

struct Person: Encodable, Decodable {
    let name: String
    let lastName: String
    let phone: String
    let email: String
}


extension Person {
    static func tempPerson() -> Person {
        let person = Person(name: "Tony", lastName: "Stark", phone: "+99919999", email: "ironman@stark.com")
        return person
    }
}
