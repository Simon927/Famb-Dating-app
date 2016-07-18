//
//  HistoryCell.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// HistoryCell Class;
class HistoryCell: UITableViewCell {

    @IBOutlet var avatarView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarView.layer.borderColor = UIColor.clearColor().CGColor
        avatarView.layer.borderWidth = 3.0
        avatarView.layer.cornerRadius = avatarView.bounds.size.width / 2
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
