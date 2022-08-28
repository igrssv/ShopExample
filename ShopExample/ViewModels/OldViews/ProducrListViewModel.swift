//
//  ProducrListViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import Foundation

class ProducrListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var detatilCategoryVM: DetatilCategoryViewModel
    @Published var isLoad = true
    
    init(detatilCategoryVM: DetatilCategoryViewModel) {
        self.detatilCategoryVM = detatilCategoryVM
        fetch()
        
    }
    func fetch() {
        NetworkManager.shared.fetchProducts(URLs: "https://fakestoreapi.com/products") { products in
            self.products = products.filter({$0.category == self.detatilCategoryVM.mainViewVM.setCategory?.titel ?? "jewelery"})
            self.isLoad = false
        }
    }
}
