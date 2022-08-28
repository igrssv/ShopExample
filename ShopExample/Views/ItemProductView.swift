//
//  ItemProductView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 10.08.2022.
//

import SwiftUI

struct ItemProductView: View {
    @ObservedObject var vm: ItemViewModel
    var namespace: Namespace.ID
    @EnvironmentObject var cart: CartViewModel // проверить
    var body: some View {
        ZStack {
            VStack {
                ImageView(vm: ImageViewModel(imageURL: vm.product.image))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 170)
                    .padding(10)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("BGImage"))
                            .shadow(color: .gray, radius: 4)
                    )
                    .padding(.bottom, 10)
                    .onTapGesture {
                        withAnimation(.interactiveSpring()) {
                            vm.detatilCategoryVM.setProduct = vm.product
                        }
                        
                    }
                Text(vm.product.title)
                    .bold()
                    .frame(height: 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("\(String(vm.product.price)) $")
                    Spacer()
                    Image(systemName: "plus.app")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("buttonColor"))
                        .frame(width: 20, height: 20)
                        .padding(.leading, 10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                vm.buyProduct()
                                cart.fetch()
                            }
                            
                        }
                }
                .frame(height: 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: 160)
        .padding(10)
        }
    }
}

struct ItemProductView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        ItemProductView(vm: ItemViewModel(product: Product.fetchOneProduct(), detatilCategoryVM: DetatilCategoryViewModel(mainViewVM: MainViewModel())), namespace: namespace)
    }
}
