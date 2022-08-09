//
//  ItemCategoryView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct ItemCategoryView: View {
    let images = ["electronics", "jewelery" , "men's clothing", "women's clothing"]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(images, id:\.self) { item in
                VStack {
                    Image(item)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay {
                            VStack {
                                Spacer()
                                HStack{
                                    Text(item.capitalized)
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .padding()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom)
                            }
                            
                        }
                }
                .frame(height: 188)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .padding()
            }
        }
        
    }
}

struct ItemCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCategoryView()
    }
}
