//
//  ProductView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 30.07.2022.
//

import SwiftUI

struct ProductView: View {
    @StateObject var vm: ProductViewModel
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ImageView(vm: ImageViewModel(imageURL: vm.product.image))
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height * 0.4)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .padding(.top)
                    Divider()
                    VStack(alignment: .leading) {
                        Text(vm.product.title)
                            .font(.largeTitle)
                            .minimumScaleFactor(0.8)
                        Text(String(vm.product.price) + " $")
                            .font(.callout)
                        Spacer(minLength: 10)
                        Text("Description:")
                            .font(.title2)
                            .bold()
                        Spacer(minLength: 10)
                        Text(vm.product.description)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
            Divider()
            VStack() {
                Button(action: {
                    vm.buyProduct()
                }) {
                    ZStack {
                        HStack {
                            Text("Buy")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                            .frame(height: 30)
                        }
                        HStack {
                            Spacer()
                            Text(vm.currentProducttoCart)
                                .font(.title2)
                            Image(systemName: "cart")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .padding(.trailing)
                    }
                    .foregroundColor(.white)
                }
                .animation(.default, value: vm.currentProducttoCart)
                .background(.blue)
                .cornerRadius(30)
                .buttonStyle(.bordered)
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(vm: ProductViewModel(product: Product.fetchOneProduct()))
    }
}
