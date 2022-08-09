//
//  ButtonCartView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 01.08.2022.
//

import SwiftUI

struct ButtonCartView: View {
    var titel: String
    var body: some View {
        VStack {
            Text(titel)
                .font(.title3)
                .frame(height: 60)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .foregroundColor(.white)
        }
        .background(titel == "Exit" ? .red : .blue)
        .cornerRadius(10)
        .padding(.horizontal)
        .padding([.top, .bottom], 10)
    }
}

struct ButtonCartView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCartView(titel: "Orders")
    }
}
