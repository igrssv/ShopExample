//
//  Shopboard.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct ShopboardView: View {
    @StateObject private var vm = ShopboardViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                BlockView(blocks: $vm.blocks)
                Spacer()
            }
            .navigationTitle("My Shop")
        }
        
    }
}

struct ShopboardView_Previews: PreviewProvider {
    static var previews: some View {
        ShopboardView()
    }
}
