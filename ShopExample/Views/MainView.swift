//
//  ContentView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        TabView {
            ShopboardView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("Shop")
                    }
                }
            Text("Cart")
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
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

