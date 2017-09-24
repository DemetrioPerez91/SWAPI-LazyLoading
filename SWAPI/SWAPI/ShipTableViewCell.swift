//
//  ShipTableViewCell.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import UIKit

class ShipTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shipImage: UIImageView!
    @IBOutlet weak var shipName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setImage(url1:String,url2:String)
    {
        DispatchQueue.global().async {
            
            ImageFetcher.instance.getImage(imageView: self.shipImage, url1: url1, url2: url2)
        }
    }
    
}
