//
//  ItemCategoryView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 09.08.2022.
//

import SwiftUI

struct ItemCategoryView: View {
    var namecpace: Namespace.ID
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
            ForEach(vm.categories, id:\.id) { item in
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .cornerRadius(20)
                        .matchedGeometryEffect(id: item.image, in: namecpace)
                    VStack(alignment: .leading) {
                        Text(item.titel.capitalized)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: "titel \(item.titel)", in: namecpace)
                    }
                    .padding()
                        
                }
                .padding()
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.2, dampingFraction: 0.8, blendDuration: 0.3)) {
                            vm.selectedCategory(category: item)
                    }
                    
                }
            }
            
        
        
        
    }
}

struct ItemCategoryView_Previews: PreviewProvider {
    @Namespace static private var namespace
    static var previews: some View {
        ItemCategoryView(namecpace: namespace, vm: MainViewModel())
    }
}


struct Images {
    var id = UUID()
    var img: String
    var name: String
}


var data = [Images(img: "men's clothing", name: "men's clothing"),
              Images(img: "electronics", name: "electronics"),
              Images(img: "jewelery", name: "jewelery"),
              Images(img: "women's clothing", name: "women's clothing")]
