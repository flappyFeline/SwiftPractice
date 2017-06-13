//
//  LibraryAPI.swift
//  PokedexGo
//
//  Created by Durand on 26/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    static let shareInstance = LibraryAPI();
    let persistencyManager = PersistencyManager()
    
    fileprivate override init() {
        super.init();
        
        NotificationCenter.default.addObserver(self, selector: #selector(LibraryAPI.shareInstance.downloadImage(_:)), name: NSNotification.Name(rawValue: downloadImageNotification), object: nil);
    }
    
    func getPokemons() -> [Pokemon] {
        return pokemons;
    }
    
    func downloadImg(_ url: String) -> (UIImage?) {
        let aUrl = URL(string: url)
        let data = try? Data(contentsOf: aUrl!)
        let image: UIImage?;
        if let data = data {
            image = UIImage(data: data)!
            return image!
        } else {
            return nil;
        }
    }
    
    func downloadImage(_ notification: Notification) {
        
        let userInfo = notification.userInfo as! [String: AnyObject];
        let pokeImageView = userInfo["pokeImageView"] as! UIImageView?;
        let pokeImageURL = userInfo["pokeImageUrl"] as! String?;
        guard let pokeImageURLUnWapped = pokeImageURL else {
            return;
        }
        if let imageViewUnWapped = pokeImageView {
            imageViewUnWapped.image = persistencyManager.getImage(URL(string: pokeImageURLUnWapped)!.lastPathComponent);
            if imageViewUnWapped.image == nil {
                
                DispatchQueue.global().async {
                    if let downloadedImage = self.downloadImg(pokeImageURLUnWapped) {
                        DispatchQueue.main.async {
                            imageViewUnWapped.image = downloadedImage;
                            self.persistencyManager.saveImage(downloadedImage, filename: (URL(string: pokeImageURLUnWapped)!.lastPathComponent));
                        }
                    }
                }
                
            }
        }
        
    }
}
