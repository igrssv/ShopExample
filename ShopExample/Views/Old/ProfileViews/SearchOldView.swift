//
//  SearchView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 08.08.2022.
//

import SwiftUI

struct SearchOldView: View {
    @StateObject var vm: ShopboardViewModel
    
    @Namespace var namespace
    var body: some View {
        VStack {
            VStack {
                ShowSearchView(search: $vm.search, namespace: namespace, type: $vm.showType, currentCategory: $vm.currenCategory)
                if vm.showType == .filter {
                    List {
                        ForEach(vm.products, id: \.id) { item in
                            Text(item.category)
                                .font(.title2)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    vm.filter(titel: item.category)
                                }
                        }
                        .listRowBackground(Color.purple)
                    }.listStyle(.plain)
                }
            }
            .animation(.spring(response: 0.5, dampingFraction: 0.9), value: vm.showType)
            .frame(height: vm.showType == .defaults ? 80 : nil)
            .frame(maxWidth: .infinity)
            .background(.purple)
            .cornerRadius(20)
            .padding()
        }
        
    }
}

struct SearchOldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchOldView(vm: ShopboardViewModel())
    }
}

struct ShowSearchView: View {
    
    @Binding var search: String
    var namespace: Namespace.ID
    @Binding var type: ShowShowSearchType
    @Binding var currentCategory: String
    var body: some View {
        HStack {
            Spacer()
            if type == ShowShowSearchType.defaults {
                TextField("Search", text: $search)
                    .matchedGeometryEffect(id: "seach", in: namespace)
                    .frame(height: 60, alignment: .leading)
                    .frame(maxWidth: currentCategory.isEmpty ? 80 : 0)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                    .onTapGesture {
                        if type != .search{
                            showSearch()
                        }
                }
            } else if type == .search {
                TextField("Search", text: $search)
                    .matchedGeometryEffect(id: "seach", in: namespace)
                    .frame(height: 60, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
            }
            
            if type == .defaults {
                Text(currentCategory.isEmpty ? "Find Something" : currentCategory.capitalized)
                    .matchedGeometryEffect(id: "titel", in: namespace)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            else if type == .filter {
                Text("Choose a category")
                    .matchedGeometryEffect(id: "titel", in: namespace)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            Spacer()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 20, height: 5)
                    .foregroundColor(.white)
                    .rotationEffect(
                    .degrees(type == .defaults ? 0 : 45))
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 20, height: 5)
                    .foregroundColor(.white)
                    .rotationEffect(
                        .degrees(type == .defaults ? 0 : -45))
                    
                
            }
            .matchedGeometryEffect(id: "rectangle", in: namespace)
            .onTapGesture {
                    show()
            }
            .padding()
        }
    }
    func showSearch() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.9)) {
        type = .search
        }
    }
    
    func degress(degress: TypeDegrees) -> Double {
        if degress == .bottom, !currentCategory.isEmpty {
            return 45
        } else if degress == .top, !currentCategory.isEmpty {
            return -45
        }
        return 0
    }
    func show() {
            switch type {
            case .search:
                type = .defaults
            case .defaults:
                type = .filter
            case .filter:
                type = .defaults
            }
    }
}

enum ShowShowSearchType {
    case search
    case defaults
    case filter
}

enum TypeDegrees {
    case top
    case bottom
}
