//
//  DeliveryViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 05.08.2022.
//

import Foundation

class DeliveryViewModel: ObservableObject {
    @Published var delivery: [Delivery] = []
    @Published var test = false
    @Published var deliverySample: [Delivery] = [
        Delivery(person: Person.tempPerson(), products: [Product.fetchOneProduct()], address: Address.tempAddress(), status: .created, date: Date())]
    
    init() {
        fetchDelivery()
    }
    
    func fetchDelivery() {
        var delivery: [Delivery] = []
        StorageManager.shared.load(key: .keyDelivery) { (value : [Delivery]) in
            delivery = value
            print("delivery value: \(value.count)")
        }
        print("Delevery count: \(delivery.count)")
        self.delivery = delivery
    }
    
    func del(index: IndexSet) {
        StorageManager.shared.deleteObject(index: index, key: .keyDelivery)
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
