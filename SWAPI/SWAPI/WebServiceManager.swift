

//
//  WebServiceManager.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import UIKit

class WebServiceManager: NSObject
{
    static let instance = WebServiceManager()
    private let config = URLSessionConfiguration.default
    override private init(){}
    
    
    let testURL = "https://swapi.co/api/starships/?page=1&format=json"
    

    func getInfo(url:String,completion:@escaping([String:AnyObject]?)->())
    {
        let session = URLSession(configuration: config)
        let request = URLRequest(url: URL(string: url)!)
        let task = session.dataTask(with: request, completionHandler: {
            data,response,error in
            
            if (error != nil||data == nil)
            {
                print(error!.localizedDescription)
                
            }
            else{
                do{
                    
                    let rootDictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:AnyObject]
                    completion(rootDictionary!)
                    
                }catch {
                    print("Error with Json")
                    completion(nil)
                }
            }
            
        })
        task.resume()
        
    }
    
    func getImage( url:String,completion:@escaping (UIImage?)->())
    {
        let session = URLSession(configuration: config)
        guard let url = URL(string: url)else{
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request, completionHandler: {
            data,response,error in
            guard let imageData = data
            else{
                completion(nil)
                return
            }
           
            if let image = UIImage(data: imageData)
            {
                completion(image)
            }
            else
            {
                completion(nil)
            }
            
        })
        task.resume()
        
    }
    
    
  
}



