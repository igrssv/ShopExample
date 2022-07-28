//
//  ContentView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(vm.blocks, id: \.id) { block in
                                BlockView(image: block.image)
                            }
                        }
                    }
            }
            .navigationTitle("My Shop")
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}

