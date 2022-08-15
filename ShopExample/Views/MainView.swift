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
        
    var body: some View {
        ZStack(alignment: .bottom) {
            if !vm.isShow{
                    VStack {
                        HStack {
                            Text("Tony Stark")
                                .font(.largeTitle)
                                .bold()
                                .minimumScaleFactor(0.6)
                            Spacer()
                            Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .clipShape(Circle())
                        }
                        .padding(.horizontal)
                        .onTapGesture {
                            
                        }
                        ScrollView(.vertical, showsIndicators: false)  {
                            ItemCategoryView(namecpace: namespace, vm: vm)
                        }
                    }
                Spacer(minLength: 60)
                SearchView()
                    
            } else {
                DetatilCategoryView(namecpace: namespace, vm: vm)
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
