//
//  ToolbarView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        HStack {
            Image(systemName: "suitcase.cart")
                .resizable()
                .frame(width: 30, height: 30)
            Spacer()
            Image(systemName: "cart")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .padding()
        .background(.white.opacity(0.1))
        .frame(height: 40)
        .frame(maxWidth: .infinity)
        
        
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
