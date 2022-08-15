//
//  NetworkManager.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 29.07.2022.
//

import Foundation

enum URLs: String {
    case products = "https://fakestoreapi.com/products"
    case categories = "user"
}

class NetworkManager {
    static var shared = NetworkManager()
    
    private init() {}
    
    func fetchProducts(URLs: String, completion: @escaping ([Product]) -> Void){
        var products: [Product] = []
        let urlString = URLs
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            do {
                 
                products = try JSONDecoder().decode([Product].self, from: data)
                print("NTM")
                DispatchQueue.main.async {
                    completion(products)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchProduct(url: URL, completion: @escaping ((Data, URLResponse) -> Void)) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error ?? "No data")
                return
            }
            
            guard let url = response.url else { return }
            
            DispatchQueue.main.async {
                completion(data, response)
            }
        }.resume()
    }
}
