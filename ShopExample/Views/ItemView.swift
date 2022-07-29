//
//  ItemView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct ItemView: View {
    let titel: String
    let price: Double
    let image: String
    var body: some View {
        VStack(alignment: .leading)  {
            AsyncImage(url: URL(string: image)) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
            } placeholder: {
                ProgressView()
            }
            Text(titel)
                .font(.title2)
                .minimumScaleFactor(0.4)
            Text("\(price) $")
                .font(.body)
            
        }
        .frame(width: 150)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(titel: "New Balance", price: 199, image: "nb")
    }
}
