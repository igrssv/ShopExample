//
//  CartViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [Product] = [] {
        didSet {
            calculation()
        }
    }
        
    @Published var finalPrice: Double = 0
    @Published var person: Person?
    @Published var address: [Address] = []
    
    init() {
        StorageManager.shared.load(key: .keyPerson) { (value: Person) in
            person = value
        }
        fetchAddress()
    }
        
    func fetch() {
        var products: [Product] = []
        StorageManager.shared.load(key: .keyProduct) { (value: [Product]) in
            products = value
        }
        self.products = products
        fetchPerson()
    }
    func fetchPerson() {
        StorageManager.shared.load(key: .keyPerson) { (value: Person) in
            self.person = value
        }
    }
    func deleteProduct(index: IndexSet) {
        StorageManager.shared.deleteObject(index: index, key: .keyProduct)
        fetch()
    }
    
    func clearCart() {
        StorageManager.shared.clear(key: .keyProduct)
        fetch()
    }
    
    func calculation() {
        finalPrice = products.map({$0.price}).reduce(0, +)
    }
}

//MARK: - address requesr and save delivery
extension CartViewModel {
    func fetchAddress() {
        StorageManager.shared.load(key: .keyAddress) { (value: [Address]) in
            address = value
        }
    }

    func arrangeDelivery() {
        let delivery = Delivery(
            person: person ?? Person.tempPerson(),
            products: products,
            address: address[0],
            status: .created,
            date: Date())
        
        StorageManager.shared.saveSet(item: delivery, key: .keyDelivery)
        StorageManager.shared.clear(key: .keyProduct)
    }
}
