//
//  MenuTableController.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
protocol MenuTableControllerDelegate : NSObjectProtocol {
    func didHome()
    func didMyChats()
    func didHistory()
    func didSetings()
    func didInviteFriends()
    func didBuyProducts()
}

// MenuTableController Class;
class MenuTableController: UITableViewController {
    
    @IBOutlet var avatarView: UIView!
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var delegate: MenuTableControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Avatar;
        avatarView.layer.borderColor = UIColor.whiteColor().CGColor
        avatarView.layer.borderWidth = 2
        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        
//      let url = NSURL(string: Account.me.avatar) as NSURL!
//      avatarImage.sd_setImageWithURL(url, placeholderImage: nil)
        
        // Name;
        nameLabel.text = Account.me.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            if (delegate.respondsToSelector("didHome")) {
                delegate.didHome()
            }
            break
            
        case 2:
            if (delegate.respondsToSelector("didMyChats")) {
                delegate.didMyChats()
            }
            break
            
        case 3:
            if (delegate.respondsToSelector("didHistory")) {
                delegate.didHistory()
            }
            break
            
        case 4:
            if (delegate.respondsToSelector("didSetings")) {
                delegate.didSetings()
            }
            break
            
        case 5:
            if (delegate.respondsToSelector("didInviteFriends")) {
                delegate.didInviteFriends()
            }
            break

        case 6:
            if (delegate.respondsToSelector("didBuyProducts")) {
                delegate.didBuyProducts()
            }
            break
            
        default:
            break
        }
    }
}
