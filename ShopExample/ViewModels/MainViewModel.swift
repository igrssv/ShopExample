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
    
    init() {
        categories = StorageManager.shared.loadCategories()
    }
    
    
    func selectedCategory(category: Category?) {
        setCategory = category
        show()
    }
    func show() {
        isShow.toggle()
    }

}
