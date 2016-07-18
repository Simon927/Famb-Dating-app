//
//  ShowViewController.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// ShowViewController Class;
class ShowViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // Selection;
        let indexPath: NSIndexPath! = NSIndexPath(forRow: 0, inSection: 0)
        tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.None)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
