//
//  MainView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct MainView: View {
    @Namespace private var namespace
    @StateObject private var vm = MainViewModel()
    @State var isShowProfile = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if !isShowProfile {
                if vm.setCategory == nil {
                VStack {
                    PersonView(isShowProfile: $isShowProfile, namespace: namespace)
                        .environmentObject(vm.profileSetup)
                    ScrollView(.vertical, showsIndicators: false)  {
                        HStack {
                            Text("Categories")
                                .font(.title)
                                .bold()
                                .italic()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        ItemCategoryView(namecpace: namespace, vm: vm)
                    }
                    Rectangle()
                        .frame(width: 2 ,height: 65)
                        .opacity(0)
                }
                SearchView()
            } else {
                DetatilCategoryView(namecpace: namespace, vm: DetatilCategoryViewModel(mainViewVM: vm))
            }
            } else {
                DetailPersonView(isShow: $isShowProfile, namespace: namespace)
                    .environmentObject(vm.profileSetup)
            }
        }
        .environmentObject(vm.cartSetup)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
