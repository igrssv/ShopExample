//
//  BlockView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct BlockView: View {
    @Binding var blocks: [Block]
    
    var body: some View {
        VStack {
            ScrollViewReader { value in
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(blocks, id: \.id) { block in
                            Image(block.image)
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
                }
            }
            
        }
    }
}
    
    struct BlockView_Previews: PreviewProvider {
        static private let blocks = Block.createSampleBlocks()
        static var previews: some View {
            BlockView(blocks: .constant(blocks))
        }
    }
