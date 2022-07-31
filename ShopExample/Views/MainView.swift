//
//  ContentView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "Main"

    var body: some View {
        TabView(selection: $selectedTab) {
            ShopboardView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("Shop")
                    }
                }
                .tag(selectedTab)
            CartView(selectedTab: $selectedTab)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
                .tag("Cart")
            Text("I")
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Person")
                    }
                }
        }
        .padding(.bottom)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}

