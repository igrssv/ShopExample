//
//  ProductsListView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 10.08.2022.
//

import SwiftUI

struct ProductsListView: View {
    @ObservedObject var vm: ProducrListViewModel
    var namespace: Namespace.ID

    let gridItems = [
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20),
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20)
    ]
    var body: some View {
        if !vm.isLoad {
            VStack {
                ZStack {
                    LazyVGrid(columns: gridItems) {
                        ForEach(vm.products, id:\.id) { product in
                            ItemProductView(vm: ItemViewModel(product: product, detatilCategoryVM: vm.detatilCategoryVM), namespace: namespace)
                        }
                    }
                    .padding()
                }
            }
        } else {
            ProgressView()
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        ProductsListView(vm: ProducrListViewModel(detatilCategoryVM: DetatilCategoryViewModel(mainViewVM: MainViewModel())), namespace: namespace)
    }
}
