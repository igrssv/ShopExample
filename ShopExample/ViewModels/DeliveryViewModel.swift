//
//  DeliveryViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 05.08.2022.
//

import Foundation

class DeliveryViewModel: ObservableObject {
    @Published var delivery: [Delivery] = []
    @Published var deliverySample: [Delivery] = [
        Delivery(person: Person.tempPerson(), products: [Product.fetchOneProduct()], address: Address.tempAddress(), status: .created, date: Date())]
    
    init() {
        fetchDelivery()
    }
    
    func fetchDelivery() {
        var delivery: [Delivery] = []
        StorageManager.shared.load(key: .keyDelivery) { (value : [Delivery]) in
            delivery = value
        }
        self.delivery = delivery.sorted(by: {$0.date > $1.date}).filter({$0.status != StatusDelivery.ready})
    }

}
