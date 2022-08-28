//
//  CachedImage.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 29.07.2022.
//

import Foundation
import SwiftUI
import UIKit

class ItemViewModel: ObservableObject {
    let product: Product
    @Published var isShow = false
    @Published var currentProducttoCart = ""
    @Published var detatilCategoryVM: DetatilCategoryViewModel
    @EnvironmentObject var cart: CartViewModel
    init(product: Product, detatilCategoryVM: DetatilCategoryViewModel) {
        self.product = product
        self.detatilCategoryVM = detatilCategoryVM
    }
    
    func buyProduct() {
        StorageManager.shared.saveSet(item: product, key: .keyProduct)
        StorageManager.shared.load(key: .keyProduct) { (value: [Product]) in
            self.currentProducttoCart = String(value.filter({$0.id == product.id}).count)
        }
    }
}
