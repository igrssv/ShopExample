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
    @Published var cart = CartViewModel()
    @Published var showAnimation = false
    
    init(product: Product) {
        self.product = product
    }
    
    func buyProduct() {
        StorageManager.shared.saveSet(item: product, key: .keyProduct)
        StorageManager.shared.load(key: .keyProduct) { (value: [Product]) in
            self.currentProducttoCart = String(value.filter({$0.id == product.id}).count)
        }
        cart.fetch()
    }
    func showAnimationButton() {
        showAnimation.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.showAnimation.toggle()
        }
    }
    func showDetailProduct() {
        isShow.toggle()
    }
}
