//
//  MenuViewController.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// MenuViewController Class;
class MenuViewController: UIViewController, MenuTableControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "MenuTableController") {
            let viewController: MenuTableController = segue.destinationViewController as MenuTableController
            viewController.delegate = self
        }
    }
    
    func didHome() {
        self.slidingViewController().topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HomeNavigationController") as UIViewController
        self.slidingViewController().resetTopViewAnimated(true)
    }
    
    func didMyChats() {
        self.slidingViewController().topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ChatNavigationController") as UIViewController
        self.slidingViewController().resetTopViewAnimated(true)
    }
    
    func didHistory() {
        self.slidingViewController().topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryNavigationController") as UIViewController
        self.slidingViewController().resetTopViewAnimated(true)
    }
    
    func didSetings() {
        self.slidingViewController().topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SettingNavigationController") as UIViewController
        self.slidingViewController().resetTopViewAnimated(true)
    }
    
    func didInviteFriends() {
        self.slidingViewController().resetTopViewAnimated(true, onComplete: { () -> Void in
            let activityItems = ["This is to share!"]
            let activities = []
            let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: activities)
            self.presentViewController(activityController, animated: true, completion: nil)
        })
    }

    func didBuyProducts() {
        self.slidingViewController().topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ProductNavigationController") as UIViewController
        self.slidingViewController().resetTopViewAnimated(true)
    }
}
