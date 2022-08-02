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
    
    private let keyProduct = "products"
    private let keyPerson = "user"

}

//MARK: - Product saved
extension StorageManager {
    
    func saveProduct(product: Product) {
        var products = decode()
        products.append(product)
        encode(products: products)
    }
    
    func loadProduct() -> [Product]  {
        return decode()
    }
    
    func deleteProduct(index: IndexSet) {
        var products = decode()
        products.remove(atOffsets: index)
        encode(products: products)
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: keyProduct)
    }
    func save(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    private func encode(products: [Product]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(products)
            save(data: data, key: keyProduct)
        } catch {
            print(error)
        }
    }
    
    private func decode() -> [Product] {
        let date = UserDefaults.standard.data(forKey: keyProduct) ?? Data()
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

//MARK: - Person saved
extension StorageManager {

    
    func clearPerson() {
        UserDefaults.standard.removeObject(forKey: keyPerson)
    }
    
    func savePerson(person: Person) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(person)
            save(data: data, key: keyPerson)
        } catch {
            print(error)
        }
    }
    
    func loadPerson() -> Person? {
        let date = UserDefaults.standard.data(forKey: keyPerson) ?? Data()
        let decode = JSONDecoder()
        do {
            return try decode.decode(Person.self, from: date)
        } catch {
            print(error)
        }
        return nil
    }
}
