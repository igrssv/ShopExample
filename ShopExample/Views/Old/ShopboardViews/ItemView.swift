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
            VStack(spacing: 2) {
                ImageView(vm: ImageViewModel(imageURL: vm.product.image))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .scale(1.1)
                            .foregroundColor(Color("BGImage"))
                            .shadow(color: .gray, radius: 4)
                    )
                    .padding(.bottom, 10)
                VStack(alignment: .leading) {
                    Text(vm.product.title)
                        .font(.title2)
                    .minimumScaleFactor(0.7)
                    Text("\(String(vm.product.price)) $")
                        .font(.headline)
                }
                .frame(width: 170, alignment: .leading)
                
//                if vm.currentProducttoCart.isEmpty {
                    Text("Buy")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(5)
                        .background(.blue)
                        .cornerRadius(20)
                        .onTapGesture {
                            vm.buyProduct()
                        }
//                }
//                else {
//                    HStack {
//                        Text("-")
//                            .padding(5)
//                            .background(.blue)
//                            .cornerRadius(20)
//                        Text(vm.currentProducttoCart)
//                            .frame(width: 20)
//                        Text("+")
//                            .padding(5)
//                            .background(.blue)
//                            .cornerRadius(20)
//                            .onTapGesture {
//                                vm.buyProduct()
//                            }
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding(5)
//                }
            }
            .foregroundColor(Color("titel"))
            .padding()
            
            .frame(width: 170, height: 250)
            
        })
    }
}

struct ItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemView(vm: ItemViewModel(product: Product.fetchOneProduct()))
            
    }
}
