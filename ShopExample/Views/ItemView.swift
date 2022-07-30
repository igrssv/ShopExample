//
//  ItemView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct ItemView: View {
    @StateObject  var vm: ImageViewModel
    
    var body: some View {
        VStack(alignment: .leading)  {
            ZStack {
                Image(uiImage: vm.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 150, height: 150)
                    .blur(radius: vm.isLoad ? 1 : 0)
                if vm.isLoad == true {
                    ProgressView()
                }
            }
            Text(vm.product.title)
                .font(.title2)
                .minimumScaleFactor(0.7)
            Text("\(String(vm.product.price)) $")
                .font(.headline)
            
            
        }
        .frame(width: 150, height: 200)
    }
}

struct ItemView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ItemView(vm: ImageViewModel(product: Product.fetchOneProduct()))
            .preferredColorScheme(.dark)
    }
}
