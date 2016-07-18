//
//  ChatListController.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// ChatListController Class;
class ChatListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChatCell", forIndexPath: indexPath) as UITableViewCell
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("ChatViewController") as ChatViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func onBtnMenu(sender: AnyObject) {
        self.slidingViewController().anchorTopViewToRightAnimated(true)
    }
}
