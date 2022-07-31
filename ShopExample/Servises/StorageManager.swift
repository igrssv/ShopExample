//
//  StorageManager.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import Foundation

class StorageManager {
    static var shared = StorageManager()
    
    init() {}
    
    private let key = "products"
    
    func saveProduct(product: Product) {
        var products = decode()
        products.append(product)
        encode(products: products)
    }
    
    func loadProduct() -> [Product]  {
        return decode()
    }
    
    func deleteProduct() {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func save(data: Data) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    private func encode(products: [Product]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(products)
            save(data: data)
        } catch {
            print(error)
        }
    }
    
    private func decode() -> [Product] {
        let date = UserDefaults.standard.data(forKey: key) ?? Data()
        let decode = JSONDecoder()
        var dataDecode: [Product] = []
        do {
            dataDecode = try decode.decode([Product].self, from: date)
        } catch {
            print(error)
        }
        return dataDecode
    }
}
