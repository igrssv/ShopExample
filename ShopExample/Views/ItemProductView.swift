//
//  ItemProductView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 10.08.2022.
//

import SwiftUI

struct ItemProductView: View {
    @ObservedObject var vm: ItemViewModel
    var body: some View {
        VStack {
            ImageView(vm: ImageViewModel(imageURL: vm.product.image))
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(vm.product.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(alignment: .bottom) {
                Text("\(String(vm.product.price)) $")
                Spacer()
                Image(systemName: "plus.app")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading])
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(width: 170, height: 250)
        
    }
}

struct ItemProductView_Previews: PreviewProvider {
    static var previews: some View {
        ItemProductView(vm: ItemViewModel(product: Product.fetchOneProduct()))
    }
}
