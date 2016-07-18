//
//  AppSettingController.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// AppSettingController Class;
class AppSettingController: UITableViewController, UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.section) {
        case 0:
            break
            
        case 1:
            break
            
        case 2 :
            switch (indexPath.row) {
            case 0:     // Logout
                let actionSheet = UIActionSheet(title: "Logout?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Logout")
                actionSheet.showInView(self.view)
                break
                
            default:
                break
            }
            break
            
        default:
            break
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, didDismissWithButtonIndex buttonIndex: Int) {
        // Deselection;
        let indexPath: NSIndexPath! = tableView.indexPathForSelectedRow()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Events;
        switch (buttonIndex) {
        case 0:     // Logout
            logout()
            break
            
        default:
            break
        }
    }
    
    func logout() {
        // Account;
        Account.me.logout()
        
        // UI;
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as LoginViewController
        AppDelegate.sharedDelegate.window?.rootViewController = viewController
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Privacy Policy" {
            let viewController = segue.destinationViewController as WebViewController
            viewController.title = "Privacy Policy"
            viewController.url = NSBundle.mainBundle().URLForResource("Privacy Policy", withExtension: "docx")
        } else if segue.identifier == "Terms of Service" {
            let viewController = segue.destinationViewController as WebViewController
            viewController.title = "Terms of Service"
            viewController.url = NSBundle.mainBundle().URLForResource("Terms of Use", withExtension: "docx")
        }
    }
}
