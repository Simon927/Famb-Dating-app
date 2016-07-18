//
//  ChatViewController.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// ChatViewController Class;
class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet var chatView: UITableView!
    @IBOutlet var messageView: UIView!
    @IBOutlet var messageText: UITextField!
    @IBOutlet var bottomSpace: NSLayoutConstraint!
    
    var count: NSInteger = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Notification;
        let defaultCenter = NSNotificationCenter.defaultCenter()
        defaultCenter.addObserver(
            self,
            selector: "willShowKeyBoard:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        defaultCenter.addObserver(
            self,
            selector: "willHideKeyBoard:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Notification;
        let defaultCenter = NSNotificationCenter.defaultCenter()
        defaultCenter.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: MessageCell
        
        if (indexPath.row % 2) == 0 {
            cell = chatView.dequeueReusableCellWithIdentifier("Sender", forIndexPath: indexPath) as MessageCell
        } else {
            cell = chatView.dequeueReusableCellWithIdentifier("Receiver", forIndexPath: indexPath) as MessageCell
        }
        
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == messageText) {
            messageText.resignFirstResponder()
        }
        
        return true
    }
    
    func willShowKeyBoard(notification: NSNotification) {
        let userInfo: NSDictionary! = notification.userInfo
        let duration: NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber).doubleValue
        let frame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        
        // Animation;
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.bottomSpace.constant = frame.height
            self.view.layoutIfNeeded()
        })
    }
    
    func willHideKeyBoard(notification: NSNotification) {
        let userInfo: NSDictionary! = notification.userInfo
        let duration: NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber).doubleValue
        
        // Animation;
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.bottomSpace.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func onBtnSend(sender: AnyObject) {
        let indexPath: NSIndexPath = NSIndexPath(forRow: count, inSection: 0) as NSIndexPath
        count = count + 1
        chatView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        
        let offset: CGPoint = CGPointMake(0, chatView.contentSize.height - chatView.frame.height)
        chatView.setContentOffset(offset, animated: true)
    }
}
