//
//  DeliveryViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 05.08.2022.
//

import Foundation

class DeliveryViewModel: ObservableObject {
    @Published var delivery: [Delivery] = [Delivery(person: Person.tempPerson(), products: [Product.fetchOneProduct(), Product.fetchOneProduct()], address: Address.tempAddress(), status: .created, date: Date())]
    @Published var test = false
    
    init() {
        fetchDelivery()
    }
    
    func fetchDelivery() {
        var delivery: [Delivery] = []
        StorageManager.shared.load(key: .keyDelivery) { (value : [Delivery]) in
            delivery = value
        }
        self.delivery = delivery
    }
    
    func del(index: IndexSet) {
        StorageManager.shared.deleteProduct(index: index, key: .keyDelivery)
        fetchDelivery()
    }
    
    func clear() {
        StorageManager.shared.clear(key: .keyDelivery)
        fetchDelivery()
    }
    func tests() {
        test.toggle()
    }
}
