//
//  Shopboard.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct ShopboardView: View {
    @StateObject private var vm = ShopboardViewModel()
    let gridItems = [
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20),
        GridItem(.flexible(minimum: 40, maximum: 250), spacing: 20)
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    BlockView(blocks: $vm.blocks)
                    LazyVGrid(columns: gridItems) {
                        ForEach(vm.products, id:\.id) { item in
                            ItemView(vm: ItemViewModel(product: item))
                        }
                    }
                    .padding()
                }
                .navigationTitle("My Shop")
                .toolbar {
                    if vm.currenCategory.isEmpty {
                        Menu {
                            ForEach(vm.products, id: \.id) { item in
                                Button(action: {vm.filter(titel: item.category)}) {
                                    Text(item.category)
                                }
                            }
                        } label: {
                            Image(systemName: "slider.vertical.3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                            
                    }
                    } else {
                        Button(action: {vm.clearFilter()}) {
                            HStack {
                                Text("vm.currenCategory")
                                    .font(.title3)
                                Image(systemName: "clear.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .padding(8)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                        }
                    }
                    
                }
                
            }
        }
        
    }
}

struct ShopboardView_Previews: PreviewProvider {
    static var previews: some View {
        ShopboardView()
    }
}
