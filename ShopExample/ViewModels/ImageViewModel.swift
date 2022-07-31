//
//  ImageView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 30.07.2022.
//

import Foundation
import UIKit

//MARK: - Checking for the presence of an image, downloading, saving to the cache
class ImageViewModel: ObservableObject {
    @Published var image = UIImage(named: "nike")
    @Published var isLoad = true
    let imageURL: String
    
    init(imageURL: String) {
        self.imageURL = imageURL
        fetchProductImage()
    }
    //MARK: - Fetch image
    func fetchProductImage() {
        guard let imageURL = URL(string: imageURL) else {
            self.image = UIImage(named: "soldout")
            return
        }
        //MARK: - Try load image to cashe
        if let cachedImage = getCachedImage(url: imageURL) {
            self.image = cachedImage
            self.isLoad = false
            return
        }
        //MARK: - Load image to network
        NetworkManager.shared.fetchProduct(url: imageURL) { data, response in
            self.image = UIImage(data: data)
            self.isLoad = false
            self.saveToCache(data: data, response: response)
        }
    }
    
    //MARK: - Save image to cache
    private func saveToCache(data: Data, response: URLResponse) {
        guard let url = response.url else { return }
        let reqest = URLRequest(url: url)
        let cached = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cached, for: reqest)
    }
    //MARK: - Load image from cache
    private func getCachedImage(url: URL) -> UIImage? {
        let reqest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: reqest) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}
