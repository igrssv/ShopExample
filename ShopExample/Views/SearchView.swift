//
//  SearchView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    @State private var isShowSearch = false
    @Namespace private var namespace
    @State private var isShow = false
    @State private var tab = ""
    @EnvironmentObject var vm: CartViewModel
    
    var body: some View {
        VStack {
            searchItem
        }
        .frame(height: 58)
        .frame(maxWidth: .infinity)
        .background(Color("buttonColor"))
        .cornerRadius(20)
        .padding()
        .padding(.bottom, 10)
    }
    
    private var searchItem: some View  {
        HStack {
            //MARK: - Custom TextField
            ZStack(alignment: .leading) {
                if search.isEmpty {
                    Text("Search...")
                        .font(.system(.subheadline, design: .default))
                        .foregroundColor(Color("textColor").opacity(0.5))
                    
                }
                TextField(text: $search) {
                    Text("")
                        .font(.system(.subheadline, design: .default))
                }
                .foregroundColor(Color("textColor"))
                
            }
            .matchedGeometryEffect(id: "search", in: namespace)
            .padding(.horizontal, 10)
            .background(.white)
            .cornerRadius(20)
            .frame(maxWidth: !isShowSearch ? 90 : .infinity)
            .onTapGesture {
                if !isShowSearch {
                    run()
                }
            }
            Spacer()
            //MARK: - switch titel SearchView
            Text(!isShowSearch ? "Find to something" : "Cancel")
                .matchedGeometryEffect(id: "titelSearch", in: namespace)
                .foregroundColor(.white)
                .font(.system(.title3, design: .default))
                .onTapGesture {
                    if isShowSearch {
                        run()
                    }
                }
            Spacer()
            //MARK: - Cart Item actions
            ZStack {
                //trigger isEmpry cart
                Circle()
                    .frame(width: vm.products.isEmpty ? 0 : (!isShowSearch ? 13 : 0))
                    .foregroundColor(.red.opacity(0.8))
                    .offset(x: 1, y: vm.products.isEmpty ? -30 : -5)
                    .matchedGeometryEffect(id: "cartGoods", in: namespace)
                Text(vm.products.count != 0 ? "\(vm.products.count)" : "")
                    .font(.system(size: 10))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: vm.products.isEmpty ? 0 : 13)
                    .offset(x: 1.3, y: vm.products.isEmpty ? -30 : -7)
                    .matchedGeometryEffect(id: "cartGoodsCount", in: namespace)
                Image(systemName: "cart.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: !isShowSearch ? 30 : 0)
                    .matchedGeometryEffect(id: "cart", in: namespace)
                    .fullScreenCover(isPresented: $isShow, content: {
                        CartView(show: $isShow)
                    })
                    .onTapGesture {
                        if !isShowSearch {
                            isShow.toggle()
                        }
                    }
                
            }
        }
        .padding(.horizontal, 10)
    }
    func run() {
        withAnimation {
            isShowSearch.toggle()
            search = ""
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(CartViewModel())
    }
}
