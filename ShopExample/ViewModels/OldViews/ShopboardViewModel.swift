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
    @Published var productsnUI: [Product] = []
    @Published var category = ""
    @Published var  isLoad = true
    
    init(category: String) {
        self.category = category
        fetch()
        
    }
    func fetch() {
        NetworkManager.shared.fetchProducts(URLs: "https://fakestoreapi.com/products") { products in
            self.products = products.filter({$0.category == self.category})
            self.isLoad = false
            
        }
    }
    
    func fetchUI() {
        var products: [Product] = []
        NetworkManager.shared.fetchProducts(URLs: "https://fakestoreapi.com/products/category/\(category)") { (value: [Product]) in
            products = value
        }
        self.productsnUI = products
    }
    
    func fetchnUI() {
        
    }
    
    func filter(titel: String) {
        currenCategory = titel
        products = products.filter({$0.category == category})
        showType = .defaults
        
    }
    
    func clearFilter() {
        currenCategory = ""
        fetch()
    }
}
