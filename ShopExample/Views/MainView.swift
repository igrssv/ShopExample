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
    @State var isShow = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if !isShow {
            if !vm.isShow {
                VStack {
                    HStack {
                        Text("Tony Stark")
                            .font(.largeTitle)
                            .bold()
                            .minimumScaleFactor(0.6)
                            .matchedGeometryEffect(id: "personName", in: namespace)
                        Spacer()
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .clipShape(Circle())
                            .matchedGeometryEffect(id: "personImage", in: namespace)
                            .onTapGesture {
                                withAnimation {
                                    isShow.toggle()
                                }
                            }
                    }
                    .padding()
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
            } else {
                DetailPersonView(isShow: $isShow, namespace: namespace)
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
