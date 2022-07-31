//
//  ItemView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct ItemView: View {
    @StateObject  var vm: ItemViewModel

    var body: some View {
        VStack(alignment: .leading)  {
            ImageView(vm: ImageViewModel(imageURL: vm.product.image))
                .cornerRadius(20)
                .frame(width: 150, height: 150)
            Text(vm.product.title)
                .font(.title2)
                .minimumScaleFactor(0.7)
            Text("\(String(vm.product.price)) $")
                .font(.headline)
        }
        .frame(width: 150, height: 200)
        .onTapGesture {
            vm.show()
        }
        .sheet(isPresented: $vm.isShow) {
            ProductView(vm: ProductViewModel(product: vm.product))
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ItemView(vm: ItemViewModel(product: Product.fetchOneProduct()))
            .preferredColorScheme(.dark)
    }
}
