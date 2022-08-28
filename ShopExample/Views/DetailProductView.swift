//
//  DetailProductView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 10.08.2022.
//

import SwiftUI

struct DetailProductView: View {
    @ObservedObject var vm: DetatilCategoryViewModel
    var namecpace: Namespace.ID
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack {
                        ImageView(vm: ImageViewModel(imageURL: vm.setProduct?.image ?? ""))
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: vm.setProduct?.image ?? "", in: namecpace)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height / 2.5)
                        VStack(alignment: .leading) {
                            Text(vm.setProduct?.title ?? "")
                                .font(.largeTitle)
                                .bold()
                                .minimumScaleFactor(0.7)
                                .matchedGeometryEffect(id: vm.setProduct?.title ?? "", in: namecpace)
                            Text(vm.setProduct?.category ?? "")
                                .font(.subheadline)
                                .italic()
                            Text(String(format: "%.2f", vm.setProduct?.price ?? 0) + " $")
                                .font(.title3)
                                .matchedGeometryEffect(id: String(format: "%.2f", vm.setProduct?.price ?? 0) , in: namecpace)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        Divider()
                        Text(vm.setProduct?.description ?? "")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                    .padding(.bottom, 65)
                }
                .padding(.top)
                CloseView()
                    .onTapGesture {
                        withAnimation(.interactiveSpring()) {
                            vm.setProduct = nil
                        }
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
                    .onTapGesture {
//                                withAnimation(.spring()) {
//                                    vm.buyProduct()
//                                    cart.fetch()
//                                }
                        
                    }
            }
            .padding()
            .frame(height: 58)
            .background(Color("buttonColor"))
            .cornerRadius(20)
            .padding()
        }
    }
}

struct DetailProductView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        DetailProductView(vm: DetatilCategoryViewModel(mainViewVM: MainViewModel()), namecpace: namespace)
    }
}
