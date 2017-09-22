//
//  JSONParser.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import UIKit

class JSONParser: NSObject
{
    static let instance = JSONParser()
    override private init(){}
    var dictionary:[String:AnyObject]?
    func setNextPage()
    {
        guard  dictionary?["next"] is NSNull == false else{
            DataManager.instance.nextPage = "none"
            return}
        DataManager.instance.nextPage = dictionary?["next"] as! String
    }
    
    func getResults()->[AnyObject]
    {
        var results:[AnyObject] = []
        results = dictionary!["results"] as! [AnyObject]
        return results
    }
    
    func parseShip(data:[String:AnyObject]) ->ShipVM?
    {
        
        
        
        var shipModel:Ship?
        let name = data["name"] as! String
        let model = data["model"] as! String
        let manufacturer = data["manufacturer"] as! String
        let starship_class = data["starship_class"] as! String
        
        shipModel = Ship(name: name, model: model, manufacturer: manufacturer, starshipClass: starship_class)
        return ShipVM(ship: shipModel!)
    }
    
    func parseShips()->[ShipVM]
    {
        var ships:[ShipVM] = []
        for result in getResults()
        {
            let ship = parseShip(data: result as! [String : AnyObject])!
            ships.append(ship)
        }
        return ships
    }
    
    func runParser(dic:[String:AnyObject])
    {
        dictionary = dic
        guard dictionary != nil else {
            return
        }
        setNextPage()
        DataManager.instance.ships += parseShips()
    }
    
}
