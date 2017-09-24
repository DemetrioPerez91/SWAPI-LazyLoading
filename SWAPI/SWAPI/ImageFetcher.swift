//
//  Extensions.swift
//  SWAPI
//
//  Created by User on 9/24/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import Foundation
import UIKit

class ImageFetcher{
    
    static let instance = ImageFetcher()
    func getImage(imageView:UIImageView,url1:String,url2:String)
    {
        WebServiceManager.instance.getImage(url: url1, completion:
            {
                result  in
                if let img = result
                {
                    self.updateImage(imageView: imageView, IMG: img)
                }
                else
                {
                    WebServiceManager.instance.getImage(url: url2, completion:
                        {
                            result in
                            if let img = result
                            {
                                self.updateImage(imageView: imageView, IMG: img)
                            }
                    })
                }
        })
      
    }
    
    func updateImage(imageView:UIImageView,IMG:UIImage)
    {
        DispatchQueue.main.async {
            imageView.image = IMG
        }
    }
    
}
