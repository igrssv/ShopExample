//
//  MainView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            VStack {
                ToolbarView()
                ItemCategoryView()
                SearchView()
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
