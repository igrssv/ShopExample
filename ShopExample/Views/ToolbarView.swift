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
            Spacer()
            Image(systemName: "xmark")
                .font(.title3)
                .foregroundColor(.black)
                .frame(height: 10)
                .padding()
                .background(Color("ToolBarButton"))
                .clipShape(Circle())
        }
        .padding(.horizontal, 10)
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
            .preferredColorScheme(.dark)
    }
}
