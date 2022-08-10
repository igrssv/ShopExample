//
//  MainView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct MainView: View {
    @State private var isShow = false
    @Namespace private var namespace
    @StateObject private var vm = MainViewModel()
    
    @State private var selected: Images = data[0]
    
    var body: some View {
        ZStack {
            if vm.setCategory == nil{
                VStack {
                    ToolbarView()
                    ItemCategoryView(namecpace: namespace, vm: vm)
                    SearchView()
                }
            } else {
                DetatilCategoryView(namecpace: namespace, vm: vm)
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
