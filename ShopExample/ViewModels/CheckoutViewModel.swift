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
    private let st = StorageManager.shared
    
    let personSample = Person(
        name: "Igor",
        lastName: "Sysoev",
        phone: "+79999889988",
        email: "igrssv@ya.ru",
        address: [
            Address(
                city: "Moscow",
                addres: "Plesheeva 14a kv 83"),
            Address(
                city: "Moscow",
                addres: "Angarskaya 4 kv 21")
        ])
    
    init(cartVM: CartViewModel) {
        self.cartVM = cartVM
        st.load(key: .keyPerson) { (value: Person) in
            person = value
        }
    }
    
    func arrangeDelivery() {
        
    }
}
