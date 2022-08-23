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
    @StateObject private var cart = CartViewModel()
    @State var isShow = false
        
    var body: some View {
        ZStack(alignment: .bottom) {
            if !vm.isShow {
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
                                .sheet(isPresented: $isShow) {
                                    ProfileView()
                                }
                                .onTapGesture {
                                    isShow.toggle()
                                }
                        }
                        .padding(.horizontal)
                        .onTapGesture {
                            
                        }
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
                    }
                Spacer(minLength: 60)
                SearchView()
            } else {
                DetatilCategoryView(namecpace: namespace, vm: vm)
                SearchView()
            }
        }
        .environmentObject(cart)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
