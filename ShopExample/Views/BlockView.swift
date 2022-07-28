//
//  BlockView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct BlockView: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .padding()
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke()
            )
    }

}

struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView(image: "nb")
    }
}
