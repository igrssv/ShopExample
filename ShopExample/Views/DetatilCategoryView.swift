//
//  ProductsView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct DetatilCategoryView: View {
    var namecpace: Namespace.ID
    @ObservedObject var vm: MainViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack {
                        Image(vm.setCategory?.image ?? "jewelery")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: vm.setCategory?.image ?? "", in: namecpace)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height / 2.5)
                            
                        Text(vm.setCategory?.titel.capitalized ?? "")
                            .font(.title3)
                            .bold()
                            
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .matchedGeometryEffect(id: "titel \(vm.setCategory?.titel ?? "")", in: namecpace)
                            .padding()
                    }
                    .padding(.bottom, 10)
                    .onTapGesture {
                        close()
                    }
                    ProductsListView(vm: ShopboardViewModel(category: vm.setCategory?.titel ?? "jewelery"))
                    Spacer(minLength: 75)
                }
//                .padding(.top ,
//                          UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea()

                ToolbarView()
                    .onTapGesture {
                        close()
                    }
                
                
            }
            SearchView()
        }
    }
    func close() {
        withAnimation(.interactiveSpring()) {
            vm.selectedCategory(category: nil)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        DetatilCategoryView(namecpace: namespace, vm: MainViewModel())
    }
}
