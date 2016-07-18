//
//  AppDelegate.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// AppDelegate Class;
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    class var sharedDelegate: AppDelegate {
        return UIApplication.sharedApplication().delegate as AppDelegate
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Status Bar;
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Fade)
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        // Navigation Bar;
        UINavigationBar.appearance().barTintColor = UIColor(red: 126.0/255.0, green: 193.0/255.0, blue: 235.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        // Navigation Item;
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Normal)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Facebook;
        FBAppEvents.activateApp()
        FBAppCall.handleDidBecomeActiveWithSession(FBSession.activeSession())
    }

    func applicationWillTerminate(application: UIApplication) {
        // Facebook;
        FBSession.activeSession().close()
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        // Facebook;
        return FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication, withSession: FBSession.activeSession())
    }
}

