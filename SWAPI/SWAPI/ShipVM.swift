//
//  ShipVM.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import UIKit

class ShipVM: NSObject
{
    let ship:Ship
    init(ship:Ship){self.ship = ship}
    
    var firebaseSearchName:String{get{return "\(ship.name)"}}
    var name:String{get{return "Name: \(ship.name)"}}
    var model:String{get {return "Model: \(ship.model)"}}
    var manufacturer:String{get{return "Manufacturer: \(ship.manufacturer)"}}
    var starshipClass:String{get{return "Class: \(ship.starshipClass)"}}
    var shipImageURLPNG:String{get{return "https://raw.githubusercontent.com/DemetrioPerez91/SWAPI-Image-Gallery/master/\(shipNameAdapter).png"}}
    var shipImageURLJPG:String{get{return "https://raw.githubusercontent.com/DemetrioPerez91/SWAPI-Image-Gallery/master/\(shipNameAdapter).jpg"}}
    
    var shipNameAdapter:String
        {
        get {
            var name = ship.name
            name = name.replacingOccurrences(of: " ", with: "%20")
            return name
        }
    }
    
}
