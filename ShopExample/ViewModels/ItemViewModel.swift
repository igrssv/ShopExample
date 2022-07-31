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
    
    init(product: Product) {
        self.product = product
    }
    
    func show() {
        isShow.toggle()
    }
}
