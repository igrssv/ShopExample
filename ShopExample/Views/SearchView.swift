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
            TextField(text: $search) {
                    Text("Search...")
                        .font(.system(.subheadline, design: .default))
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
            Image(systemName: "cart.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width:!isShowSearch ? 30 : 0)
                .matchedGeometryEffect(id: "person", in: namespace)
        }
        .padding(.horizontal, 10)
    }
    func run() {
        withAnimation {
            isShowSearch.toggle()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewInterfaceOrientation(.portrait)
    }
}
