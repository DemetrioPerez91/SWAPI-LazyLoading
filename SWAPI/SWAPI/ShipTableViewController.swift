//
//  ShipTableViewController.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import UIKit

class ShipTableViewController: UITableViewController {

    var selectedShip:ShipVM?
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.register(UINib(nibName: "ShipTableViewCell", bundle: nil), forCellReuseIdentifier: "CellID")
        
        let url = "https://swapi.co/api/starships/?format=json&page=1"
        WebServiceManager.instance.getInfo(url: url, completion: {
            data in
            JSONParser.instance.runParser(dic: data!)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return DataManager.instance.ships.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! ShipTableViewCell
        cell.shipName?.text = DataManager.instance.ships[indexPath.row].name
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == (DataManager.instance.ships.count-1) {
            loadNextBatch()
        }
    }
    
    func loadNextBatch()
    {
        if DataManager.instance.nextPage != "none"{
            WebServiceManager.instance.getInfo(url:DataManager.instance.nextPage , completion: {
                data in
                JSONParser.instance.runParser(dic: data!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedShip = DataManager.instance.ships[indexPath.row]
        performSegue(withIdentifier: "DetailSegue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue"
        {
            let VC = segue.destination as! DetailsViewController
            VC.ship = selectedShip
        }
    }
    


}
