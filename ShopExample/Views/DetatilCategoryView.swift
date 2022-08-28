//
//  ProductsView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct DetatilCategoryView: View {
    var namecpace: Namespace.ID
    @ObservedObject var vm: DetatilCategoryViewModel
    @State private var scale: CGFloat = 1
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                ScrollView {
                    //MARK: - Detail image and titel category
                    VStack {
                        Image(vm.mainViewVM.setCategory?.image ?? "jewelery")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: vm.mainViewVM.setCategory?.image ?? "", in: namecpace)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height / 2.5)
                        Text(vm.mainViewVM.setCategory?.titel.capitalized ?? "")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .matchedGeometryEffect(id: "titel \(vm.mainViewVM.setCategory?.titel ?? "")", in: namecpace)
                            .padding()
                    }
                    .cornerRadius(scale == 1 ? 0 : 20)
                    .scaleEffect(scale)
                    //MARK: - action gesture
                    .gesture(DragGesture(minimumDistance: 0).onChanged({ value in
                        onChanged(value: value)
                    }).onEnded({ value in
                        onEditing(value: value)
                    }))
                    .padding(.bottom, 10)
                    .onTapGesture {
                        close()
                    }
                    //MARK: - Product list view
                    ProductsListView(vm: ProducrListViewModel(detatilCategoryVM: vm), namespace: namecpace)
                    Rectangle()
                        .frame(width: 2 ,height: 65)
                        .opacity(0)
                }
                .ignoresSafeArea()
                
                CloseView()
                    .onTapGesture {
                        close()
                    }
            }
            SearchView()
        }
        
    }
    
    //MARK: - Close gesture actions
    func onChanged(value: DragGesture.Value) {
        let scale = value.translation.height / UIScreen.main.bounds.height
        self.scale = 1 - scale
    }
    func onEditing(value: DragGesture.Value) {
        withAnimation(.spring()) {
            if scale < 0.8 {
                close()
            } else {
                scale = 1
            }
        }
    }
    
    func close() {
        withAnimation(.interactiveSpring()) {
            vm.mainViewVM.selectedCategory(category: nil)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        DetatilCategoryView(namecpace: namespace, vm: DetatilCategoryViewModel(mainViewVM: MainViewModel()))
    }
}
