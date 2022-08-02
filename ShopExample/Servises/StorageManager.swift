//
//  StorageManager.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 31.07.2022.
//

import Foundation

enum Keys: String {
    case keyProduct = "products"
    case keyPerson = "user"
}

class StorageManager {
    static var shared = StorageManager()
    
    init() {}

}

extension StorageManager {
    
    func saveProduct(product: Product) {
        var products: [Product] = []
        load(key: .keyProduct) { (value: [Product]) in
            products = value
        }
        products.append(product)
        saveData(saveData: products, key: Keys.keyProduct)
    }
    
    func saveData<T: Encodable & Decodable>(saveData: T, key: Keys) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(saveData)
            save(data: data, key: key.rawValue)
        } catch {
            print(error)
        }
    }
    
    func save(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func clear(key: Keys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    func load<T: Encodable & Decodable>(key: Keys, compliction: (T) -> ())  {
        let date = UserDefaults.standard.data(forKey: key.rawValue) ?? Data()
        let decode = JSONDecoder()
        do {
            var object: T
            object = try decode.decode(T.self, from: date)
            compliction(object)
        } catch {
            print(error)
        }
    }
    
    func deleteProduct(index: IndexSet, key: Keys) {
        var data: [Product] = []
        load(key: key) { (value: [Product]) in
            data = value
        }
        data.remove(atOffsets: index)
        saveData(saveData: data, key: key)
    }
}
