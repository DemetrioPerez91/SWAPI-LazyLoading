//
//  DataManager.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import UIKit

class DataManager: NSObject
{
    static let instance = DataManager()
    override private init(){}
    var nextPage = ""
    var ships:[ShipVM]=[]
    
    

}
