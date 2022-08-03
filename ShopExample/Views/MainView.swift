//
//  ContentView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = ""

    var body: some View {
        TabView(selection: $selectedTab) {
            ShopboardView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("Shop")
                    }
                }
                .tag("Main")
            CartView(selectedTab: $selectedTab)
                .tabItem {
                    CartIconView(vm: CartViewModel())
                }
                .tag("Cart")
            ProfileView()
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Person")
                    }
                }
                .tag("Profile")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}

