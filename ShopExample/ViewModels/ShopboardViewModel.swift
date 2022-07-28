//
//  MainViewModel.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 26.07.2022.
//

import Foundation

class ShopboardViewModel: ObservableObject {
    @Published var product: Product?
    @Published var blocks: [Block] = Block.createSampleBlocks()
    
    init() {
        
    }
    
    
    func fetch() {
        let urlString = "https://fakestoreapi.com/products/1"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            
            guard let data = data else {return}
            
            do {
                self.product = try JSONDecoder().decode(Product.self, from: data)
                             
            } catch {
                print(error)
            }
            
            
        }.resume()
    }
    
    func transformToUrl(urlString: String) -> URL {
        let url = URL(string: urlString)
        
        return url!
    }
}
