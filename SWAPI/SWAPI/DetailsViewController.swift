//
//  DetailsViewController.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Model: UILabel!
    @IBOutlet weak var Manufacter: UILabel!
    @IBOutlet weak var StarShipClass: UILabel!
    var ship:ShipVM?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Name.text = ship?.name
        Model.text = ship?.model
        Manufacter.text = ship?.manufacturer
        StarShipClass.text = ship?.starshipClass
        
    }




}
