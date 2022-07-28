//
//  Block.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 28.07.2022.
//

import Foundation

struct Block: Identifiable {
    let id = UUID()
    let titel: String
    let image: String
}

extension Block {
    static func createSampleBlocks() -> [Block] {
        var blocks: [Block] = []
        let data = DataManager.shared
        
        for id in 0..<data.image.count {
            blocks.append(createSampleBlock(id: id))
        }
        return blocks
    }
    
    static func createSampleBlock(id: Int) -> Block {
        let data = DataManager.shared
        let block = Block(
            titel: data.name[id],
            image: data.image[id])
        return block
    }
}
