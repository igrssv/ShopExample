//
//  BlockView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import SwiftUI

struct BlockView: View {
    @Binding var blocks: [Block]
    @State private var currentindex = 0
    
    var body: some View {
        VStack {
            ScrollViewReader { value in
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(blocks.indices) { index in
                                Image(blocks[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width, height: 150)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke()
                                    )
                                    .id(index)
                                    
                            }
                        }
                    }
                    .onAppear {
                        switchBlocks(value: value)
                    }
                    .onChange(of: currentindex) { newValue in
                        switchBlocks(value: value)
                    }
            }
        }
    }
    func switchBlocks(value: ScrollViewProxy) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                if currentindex >= blocks.count - 1 {
                    currentindex = 0
                    value.scrollTo(currentindex)
                } else {
                    currentindex += 1
                }
                value.scrollTo(currentindex)
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
