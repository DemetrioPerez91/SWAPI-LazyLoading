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
    
    var name:String{get{return "Name: \(ship.name)"}}
    var model:String{get {return "Model: \(ship.model)"}}
    var manufacturer:String{get{return "Manufacturer: \(ship.manufacturer)"}}
    var starshipClass:String{get{return "Class: \(ship.starshipClass)"}}
    
}
