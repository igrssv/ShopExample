//
//  ProductsView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct DetatilCategoryView: View {
    var namecpace: Namespace.ID
    @StateObject private var vmS = ShopboardViewModel()
    @ObservedObject var vm: MainViewModel
    
    
    let gridItems = [
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20),
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20)
    ]
    var body: some View {
        ScrollView {
            VStack {
                Image(vm.setCategory?.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: vm.setCategory?.image ?? "", in: namecpace)
                Text(vm.setCategory?.titel.capitalized ?? "")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "titel \(vm.setCategory?.titel ?? "")", in: namecpace)
                    .padding()     
            }
            
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .padding(.top)

            .onTapGesture {
                withAnimation(.spring()) {
                    vm.selectedCategory(category: nil)
                }
            }
//            LazyVGrid(columns: gridItems) {
//                ForEach(vm.products, id:\.id) { item in
//                    ItemView(vm: ItemViewModel(product: item))
//                }
//            }
//            .padding()
        }
        .padding(.top)
    }
}

struct ProductsView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        DetatilCategoryView(namecpace: namespace, vm: MainViewModel())
    }
}
