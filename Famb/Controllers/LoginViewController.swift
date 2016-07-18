//
//  LoginViewController.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// LoginViewController Class;
class LoginViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var introView: UICollectionView!
    @IBOutlet var topSpace: NSLayoutConstraint!
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var bottomSpace: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (Account.me.isAuthorized()) {
            let storyboard: UIStoryboard! = self.storyboard
            let viewController = storyboard.instantiateViewControllerWithIdentifier("SlidingViewController") as SlidingViewController
            
            AppDelegate.sharedDelegate.window?.rootViewController = viewController
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return introView.bounds.size
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = introView.dequeueReusableCellWithReuseIdentifier("IntroCell", forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = introView.contentOffset.x
        let width = introView.bounds.size.width
        let page = Int(offset / width)
        pageControl.currentPage = page
    }
    
    func fetchProfile() {
        let request = FBRequest(forGraphPath: "me?fields=id,name,first_name,last_name,gender,birthday,email,picture")
        request.startWithCompletionHandler({ (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
            if (error != nil) {
                self.didLoginFailed()
            } else {
                let userObject = result as FBGraphObject!
                self.fetchProfileFromFacebook(userObject)
            }
        })
    }
    
    func fetchProfileFromFacebook(userObject: FBGraphObject!) {
        let id = userObject["id"] as String!
        let name = userObject["name"] as String!
        let firstname = userObject["first_name"] as String!
        let lastname = userObject["last_name"] as String!
        let gender = userObject["gender"] as String!
        let birthday = userObject["birthday"] as String!
        let email = userObject["email"] as String!

        APIClient.sharedClient.loginWithFacebook(name, firstname: firstname, lastname: lastname, birthday: "", gender: "", email: email, facebookId: id, facebookToken: "", completion: { (successed) -> Void in
            if (successed) {
                self.didLoginSuccessed()
            } else {
                self.didLoginFailed()
            }
        })
    }

    func didLoginSuccessed() {
        // Hide;
        MBProgressHUD.hideHUDForView(self.view, animated: true)
        
        // UI;
        let storyboard: UIStoryboard! = self.storyboard
        let viewController = storyboard.instantiateViewControllerWithIdentifier("SlidingViewController") as SlidingViewController
        AppDelegate.sharedDelegate.window?.rootViewController = viewController
    }
    
    func didLoginFailed() {
        // Hide;
        MBProgressHUD.hideHUDForView(self.view, animated: true)
    }
    
    @IBAction func onPageChanged(sender: AnyObject) {
        let page = CGFloat(pageControl.currentPage)
        let width = introView.bounds.size.width
        introView.setContentOffset(CGPointMake(page * width, 0), animated: true)
    }
    
    @IBAction func onBtnFacebook(sender: AnyObject) {
        // Show;
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
        // Session;
        if (!FBSession.activeSession().isOpen) {
            if (FBSession.activeSession().state != FBSessionState.Created) {
                var session: FBSession = FBSession(permissions: ["email", "user_birthday"])
                FBSession.setActiveSession(session)
            }
            
            FBSession.activeSession().openWithCompletionHandler({ (session: FBSession!, status: FBSessionState, error: NSError!) -> Void in
                if (error != nil) {
                    self.didLoginFailed()
                } else {
                    self.fetchProfile()
                }
                return
            })
        } else {
            fetchProfile()
        }
    }
    
    @IBAction func onBtnInfo(sender: AnyObject) {
        let height = introView.bounds.height
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.topSpace.constant = 28 - height
            self.bottomSpace.constant = height
            self.view.layoutIfNeeded()
        })
    }
}
