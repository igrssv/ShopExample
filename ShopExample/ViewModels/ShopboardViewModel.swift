//
//  MainViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import Foundation

class ShopboardViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var blocks: [Block] = Block.createSampleBlocks()
    @Published var showType: ShowShowSearchType = .defaults
    @Published var search = ""
    @Published var currenCategory = ""
    
    init() {
        fetch()
    }
    func fetch() {
        NetworkManager.shared.fetchProducts { products in
            self.products = products
        }
    }
    
    func filter(titel: String) {
        currenCategory = titel
        products = products.filter({$0.category == currenCategory})
        showType = .defaults
        
    }
    
    func clearFilter() {
        currenCategory = ""
        
        fetch()
    }
}
