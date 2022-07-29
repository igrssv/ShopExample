//
//  NetworkManager.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 29.07.2022.
//

import Foundation

class NetworkManager {
    static var shared = NetworkManager()
    
    private init() {}
    
    func fetchProducts(completion: @escaping ([Product]) -> Void){
        var products: [Product] = []
        let urlString = "https://fakestoreapi.com/products"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {return}
            do {
                products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    completion(products)
                }
            } catch {
                print(error)
            }
        }.resume()
        
        
        
    }
}
