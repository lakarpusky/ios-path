//
//  NetworkManager.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import SwiftUI

// .. apple recommends that this like (network managers) be a singleton
final class NetworkManager {
    
    // .. create our singleton, basic implementation of a singleton
    static let shared = NetworkManager()
    // .. to store download images in cache in {Key:Value} pair
    private let cache =  NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    // .. using concurrency by async/await
    // .. and we mark the function with "throws" so it will return errors
    func getAppetizers() async throws -> [Appetizer] {
        
        // .. lets make sure the url that I want to use works
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        // .. lets download our data, here (data, response) are required
        // .. the old way (data, response, error) were optionals
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    
    // .. to download each appetizer image
    // 1. we don't need a "Result<> "type, because we don't care about the failure case
    // .. all we want to return its an "UIImage" or nil
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        // .. lets make sure is not in the cache
        let cacheKey = NSString(string: urlString)
        
        // .. if the image exist in cache, return it
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // .. so the image is not in cache
        
        guard let url = URL(string: urlString) else {
            completed(nil) // .. we don't care about an error
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            // .. if I have data, extract it and initialize an "UIImage" from that data
            guard let data, let image = UIImage(data: data) else {
                completed(nil) // .. we don't care about an error
                return
            }
            
            // .. we have our image, so lets put it in the cache
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume() // .. trigger the call
    }
}
