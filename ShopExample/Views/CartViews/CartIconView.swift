//
//  CartIconView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 02.08.2022.
//

import SwiftUI

struct CartIconView: View {
    @StateObject var vm: CartViewModel
    var body: some View {
        VStack {
            Image(systemName: "cart")
            Text(vm.products.isEmpty ?
                 "Cart" :
                    "\(vm.products.count)")
        }
        .animation(.default, value: vm.products.count)
    }
    
    struct CartIconView_Previews: PreviewProvider {
        static var previews: some View {
            CartIconView(vm: CartViewModel())
        }
    }
}
