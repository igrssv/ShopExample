//
//  DetailProductView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 10.08.2022.
//

import SwiftUI

struct DetailProductView: View {
    @ObservedObject var vm: ItemViewModel
    @EnvironmentObject var cart: CartViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack {
                        ImageView(vm: ImageViewModel(imageURL: vm.product.image))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height / 2.5)
                        VStack(alignment: .leading) {
                            Text(vm.product.title)
                                .font(.largeTitle)
                                .bold()
                                .minimumScaleFactor(0.7)
                            Text(vm.product.category)
                                .font(.subheadline)
                                .italic()
                            Text(String(format: "%.2f", vm.product.price) + " $")
                                .font(.title3)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        Divider()
                        Text(vm.product.description)
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                    .padding(.bottom, 65)
                }
                .padding(.top)
                CloseView()
                    .onTapGesture {
                        vm.showDetailProduct()
                    }
            }
            //MARK: - Button bye to cart product
            HStack {
                Text("Bye")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)        
                Spacer()
                Image(systemName: "plus.app")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .padding(.leading, 10)
            }
            .padding()
            .frame(height: 58)
            .background(vm.showAnimation ? .red : Color("buttonColor"))
            .cornerRadius(20)
            .onTapGesture {
                vm.buyProduct()
                cart.fetch()
                withAnimation(.easeInOut) {
                    vm.showAnimationButton()
                }
            }
            .padding()
            .scaleEffect(vm.showAnimation ? 1.04: 1)
        }
    }
}

struct DetailProductView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        DetailProductView(vm: ItemViewModel(product: Product.fetchOneProduct()))
    }
}
