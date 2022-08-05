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
        NavigationLink(destination: {
            ProductView(vm: ProductViewModel(product: vm.product))
        }, label: {
            VStack(alignment: .leading) {
                ImageView(vm: ImageViewModel(imageURL: vm.product.image))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .scale(1.1)
                            .foregroundColor(Color("BGImage"))
                    )
                Text(vm.product.title)
                    .font(.title2)
                    .minimumScaleFactor(0.7)
                Text("\(String(vm.product.price)) $")
                    .font(.headline)
            }
            .foregroundColor(.black)
            .frame(width: 150, height: 200)
        })
    }
}

struct ItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemView(vm: ItemViewModel(product: Product.fetchOneProduct()))
            .preferredColorScheme(.dark)
    }
}
