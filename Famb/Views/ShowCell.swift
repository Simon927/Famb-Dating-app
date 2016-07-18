//
//  ShowCell.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// ShowCell Class;
class ShowCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Accessory;
        self.accessoryType = selected ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
    }

}
