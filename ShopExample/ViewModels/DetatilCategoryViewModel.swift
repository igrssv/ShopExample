//
//  DetatilCategoryViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.08.2022.
//

import Foundation

class DetatilCategoryViewModel: ObservableObject {
    @Published var mainViewVM: MainViewModel
    @Published var setProduct: Product? = nil
    
    init(mainViewVM: MainViewModel) {
        self.mainViewVM = mainViewVM
    }
}
