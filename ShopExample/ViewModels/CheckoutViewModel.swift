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
    
    let personSample = Person(
        name: "Igor",
        lastName: "Sysoev",
        phone: "+79999889988",
        email: "igrssv@ya.ru")
    
    init(cartVM: CartViewModel) {
        self.cartVM = cartVM
        st.load(key: .keyPerson) { (value: Person) in
            person = value
        }
    }
    
    func fetchAddress() {
        
    }
    
    func arrangeDelivery() {
        
    }
}
