//
//  CachedImage.swift
//  Avocado
//
//  Created by Mihir Daka on 2/17/25.
//

import Foundation
import UIKit

final class ImageCache{
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    
    private init () {}
    
    // setter
    func setImage(_ image: UIImage, forKey key:String){
        cache.setObject(image, forKey: key as NSString)
    }
    
    //getter
    func getImage(forKey key:String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
}

final class CachedImageLoader: ObservableObject {
    @Published var image: UIImage? // can be nil
    
    func load(from url: URL) async {
        let cacheKey = url.absoluteString
        
        if let cacheImage = ImageCache.shared.getImage(forKey: cacheKey) {
            DispatchQueue.main.async {
                self.image = cacheImage
            }
            return
        }
        
        // download
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let downloadedImage  = UIImage(data: data) else {return}
            
            ImageCache.shared.setImage(downloadedImage, forKey: cacheKey)
            
            DispatchQueue.main.async{
                self.image = downloadedImage
            }
        } catch {
            print("Failed to load image")
        }
    }
    
    
}




