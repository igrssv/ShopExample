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
    @State private var scale: CGFloat = 1
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
                    .cornerRadius(scale == 1 ? 0 : 20)
                    .scaleEffect(scale)
                    .gesture(DragGesture(minimumDistance: 0).onChanged({ value in
                        onChanged(value: value)
                    }).onEnded({ value in
                        onEditing(value: value)
                    }))
                    .padding(.bottom, 10)
                    .onTapGesture {
                        close()
                    }
                    ProductsListView(vm: ShopboardViewModel(category: vm.setCategory?.titel ?? "jewelery"))
                    Spacer(minLength: 75)
                }
                .ignoresSafeArea()
                ToolbarView()
                    .onTapGesture {
                        close()
                    }
            }
            SearchView()
        }
        
    }
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
