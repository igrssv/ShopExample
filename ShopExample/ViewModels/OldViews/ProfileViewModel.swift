//
//  ProfileViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 01.08.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var person: Person?
    @Published var isShow = false
    
    init() {
        fetchPerson()
    }
    
    func fetchPerson() {
        var person: Person?
        StorageManager.shared.load(key: .keyPerson) { (value: Person) in
            person = value
        }
        self.person = person
    }
    
    func clearPerson() {
        StorageManager.shared.clear(key: .keyPerson)
        fetchPerson()
    }
    
    func showCreateCiew() {
        isShow.toggle()
        fetchPerson()
    }
}
