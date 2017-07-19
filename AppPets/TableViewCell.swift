//
//  TableViewCell.swift
//  AppPets
//
//  Created by Moises on 7/18/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell{
    
    
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
