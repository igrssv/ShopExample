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
        self.person = StorageManager.shared.loadPerson()
    }
    
    func clearPerson() {
        StorageManager.shared.clearPerson()
        fetchPerson()
    }
    
    func showCreateCiew() {
        isShow.toggle()
        fetchPerson()
    }
}
