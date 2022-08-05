//
//  CheckoutViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 03.08.2022.
//

import Foundation

class CheckoutViewModel: ObservableObject {
    let cartVM: CartViewModel
    var person: Person?
    @Published var address: [Address] = []
    private let st = StorageManager.shared
    
    init(cartVM: CartViewModel) {
        self.cartVM = cartVM
        st.load(key: .keyPerson) { (value: Person) in
            person = value
        }
        fetchAddress()
    }
    
    func fetchAddress() {
        st.load(key: .keyAddress) { (value: [Address]) in
            address = value
        }
    }
    
    let personSample = Person(
        name: "Igor",
        lastName: "Sysoev",
        phone: "+79999889988",
        email: "igrssv@ya.ru")
    
  
    func arrangeDelivery() {
        var deleverySet: [Delivery] = []
        let delivery = Delivery(
            person: person ?? Person.tempPerson(),
            products: cartVM.products,
            address: address[0],
            status: .created,
            date: Date())
        deleverySet.append(delivery)
        
        StorageManager.shared.saveSet(item: delivery, key: .keyDelivery)
        StorageManager.shared.clear(key: .keyProduct)
    }
}
