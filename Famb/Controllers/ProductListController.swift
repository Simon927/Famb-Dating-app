//
//  ProductListController.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// SettingViewController Class;
class ProductListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onBtnMenu(sender: AnyObject) {
        self.slidingViewController().anchorTopViewToRightAnimated(true)
    }
}
