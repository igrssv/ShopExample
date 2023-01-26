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
    case keyAddress = "address"
    case keyDelivery = "delivery"
}

class StorageManager {
    static var shared = StorageManager()
    
    init() {}

}

extension StorageManager {
    //MARK: - Save sets object
    func saveSet<T: Encodable & Decodable>(item: T, key: Keys) {
        var sets: [T] = []
        load(key: key) { (value: [T]) in
            sets = value
        }
        sets.append(item)
        saveData(saveData: sets, key: key)
    }
    //MARK: - Save first object
    func saveData<T: Encodable & Decodable>(saveData: T, key: Keys) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(saveData)
            save(data: data, key: key.rawValue)
        } catch {
            print(error)
        } 
    }
    //MARK: - Save Data
    func save(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    //MARK: - Clear Data
    func clear(key: Keys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    //MARK: - Load Data
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
    //MARK: - Delete one object
    func deleteObject(index: IndexSet, key: Keys) {
        var data: [Product] = []
        load(key: key) { (value: [Product]) in
            data = value
        }
        data.remove(atOffsets: index)
        saveData(saveData: data, key: key)
    }
}

    //MARK: - Load category
extension StorageManager {
    func loadCategories() -> [Category] {
        var categories: [Category] = []
        let dataManager = DataManager.shared.category
        
        for item in dataManager {
            let category = Category(titel: item, image: item)
            categories.append(category)
        }
        
        return categories
    }
    
}
