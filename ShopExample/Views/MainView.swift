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
                    Text("Shop")
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

