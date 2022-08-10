//
//  CreatePersonViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 01.08.2022.
//

import Foundation

class CreatePersonViewModel: ObservableObject {
    @Published var name = ""
    @Published var lastName = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var city = ""
    @Published var addres = ""
    @Published var home = ""
    @Published var profileVM: ProfileViewModel
    
    init(profileVM: ProfileViewModel) {
        self.profileVM = profileVM
    }
    
    func save() {
        let person = Person(
            name: name,
            lastName: lastName,
            phone: phone,
            email: email)
        StorageManager.shared.saveData(saveData: person, key: .keyPerson)
        
        let address: [Address] = [
            Address(
                city: city,
                addres: addres,
                home: home)]
        StorageManager.shared.saveData(saveData: address, key: .keyAddress)
        profileVM.showCreateCiew()
    }
}
