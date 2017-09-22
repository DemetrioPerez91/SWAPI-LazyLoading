//
//  Ship.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import UIKit

class Ship: NSObject
{
    let name:String
    let model:String
    let manufacturer:String
    let starshipClass:String
    
    init(name:String, model:String, manufacturer:String,starshipClass:String)
    {
        self.name = name
        self.model = model
        self.manufacturer = manufacturer
        self.starshipClass = starshipClass
    }

}
