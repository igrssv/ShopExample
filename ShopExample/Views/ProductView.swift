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
                    Image(vm.product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: UIScreen.main.bounds.height * 0.4)
                        .frame(maxWidth: .infinity)
                    Divider()
                    VStack(alignment: .leading) {
                        Text(vm.product.title)
                            .font(.largeTitle)
                            .minimumScaleFactor(0.8)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        Text(String(vm.product.price) + " $")
                            .font(.callout)
                        Spacer(minLength: 10)
                        Text("Description:")
                            .font(.title2)
                            .bold()
                        Spacer(minLength: 10)
                        Text(vm.product.description)
                    }
                    .padding(.horizontal)
                }
            }
            Divider()
            VStack() {
                Button(action: {}) {
                    Text("Buy")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                }
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
