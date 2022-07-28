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
        
        for element in 0..<data.image.count {
            let block = Block(
                titel: data.name[element],
                image: data.image[element])
            blocks.append(block)
        }
        return blocks
    }
}
