//
//  MainViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 10.08.2022.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var categories: [Category] =  []
    @Published var setCategory: Category? = nil
    @Published var isShow = false
    @Published var cartSetup = CartViewModel()
    @Published var person: Person? = nil
    @Published var profileSetup = ProfileViewModel()
    init() {
        categories = StorageManager.shared.loadCategories()
        StorageManager.shared.load(key: .keyPerson , compliction: { (value: Person) in
            person = value
        })
        
    }
    
    func selectedCategory(category: Category?) {
        setCategory = category
        show()
    }
    func show() {
        isShow.toggle()
    }

}
