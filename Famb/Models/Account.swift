//
//  Account.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
let kAccountId: NSString = "id"
let kAccountName: NSString = "name"
let kAccountFirstname: NSString = "firstname"
let kAccountLastname: NSString = "lastname"
let kAccountEmail: NSString = "email"
let kAccountGender: NSString = "gender"
let kAccountBirthday: NSString = "birthday"
let kAccountBio: NSString = "bio"
let kAccountDiscovery: NSString = "discovery"
let kAccountDistance: NSString = "distance"
let kAccountMinOfAge: NSString = "minofage"
let kAccountMaxOfAge: NSString = "maxofage"
let kAccountShow: NSString = "show"
let kAccountMatch: NSString = "match"
let kAccountMessage: NSString = "message"
let kAccountLike: NSString = "like"
let kAccountVibration: NSString = "vibration"

// Account Class;
class Account: NSObject {
    
    var id: String! {
        set {
            setString(newValue, forKey: kAccountId)
        }
        get {
            return stringForKey(kAccountId)
        }
    }
    
    var name: String! {
        set {
            setString(newValue, forKey: kAccountName)
        }
        get {
            return stringForKey(kAccountName)
        }
    }
    
    var firstname: String! {
        set {
            setString(newValue, forKey: kAccountFirstname)
        }
        get {
            return stringForKey(kAccountFirstname)
        }
    }
    
    var lastname: String! {
        set {
            setString(newValue, forKey: kAccountLastname)
        }
        get {
            return stringForKey(kAccountLastname)
        }
    }
    
    var email: String! {
        set {
            setString(newValue, forKey: kAccountEmail)
        }
        get {
            return stringForKey(kAccountEmail)
        }
    }
    
    var gender: String! {
        set {
            setString(newValue, forKey: kAccountGender)
        }
        get {
            return stringForKey(kAccountGender)
        }
    }
    
    var birthday: String! {
        set {
            setString(newValue, forKey: kAccountBirthday)
        }
        get {
            return stringForKey(kAccountBirthday)
        }
    }
    
    var bio: String! {
        set {
            setString(newValue, forKey: kAccountBio)
        }
        get {
            return stringForKey(kAccountBio)
        }
    }
    
    var discovery: String! {
        set {
            setString(newValue, forKey: kAccountDiscovery)
        }
        get {
            return stringForKey(kAccountDiscovery)
        }
    }
    
    var distance: String! {
        set {
            setString(newValue, forKey: kAccountDistance)
        }
        get {
            return stringForKey(kAccountDistance)
        }
    }
    
    var minOfAge: String! {
        set {
            setString(newValue, forKey: kAccountMinOfAge)
        }
        get {
            return stringForKey(kAccountMinOfAge)
        }
    }
    
    var maxOfAge: String! {
        set {
            setString(newValue, forKey: kAccountMaxOfAge)
        }
        get {
            return stringForKey(kAccountMaxOfAge)
        }
    }
    
    var show: String! {
        set {
            setString(newValue, forKey: kAccountShow)
        }
        get {
            return stringForKey(kAccountShow)
        }
    }
    
    var match: String! {
        set {
            setString(newValue, forKey: kAccountMatch)
        }
        get {
            return stringForKey(kAccountMatch)
        }
    }
    
    var message: String! {
        set {
            setString(newValue, forKey: kAccountMessage)
        }
        get {
            return stringForKey(kAccountMessage)
        }
    }
    
    var like: String! {
        set {
            setString(newValue, forKey: kAccountLike)
        }
        get {
            return stringForKey(kAccountLike)
        }
    }
    
    var vibration: String! {
        set {
            setString(newValue, forKey: kAccountVibration)
        }
        get {
            return stringForKey(kAccountVibration)
        }
    }
    
    class var me: Account {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var me: Account? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.me = Account()
        }
        return Static.me!
    }
    
    func isAuthorized() -> Bool {
        return (id != nil)
    }
    
    func logout() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey(kAccountId)
        userDefaults.removeObjectForKey(kAccountName)
        userDefaults.removeObjectForKey(kAccountEmail)
        userDefaults.synchronize()
    }
    
    func setAttributes(attributes: AnyObject!) {
        id = attributes["userid"] as String!
        name = attributes["name"] as String!
        email = attributes["email"] as String!
    }
    
    func setString(value: String?, forKey: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(value, forKey: forKey)
        userDefaults.synchronize()
    }
    
    func setInteger(value: Int, forKey: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(value, forKey: forKey)
        userDefaults.synchronize()
    }
    
    func setBool(value: Bool, forKey: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(value, forKey: forKey)
        userDefaults.synchronize()
    }
    
    func stringForKey(defaultName: String) -> String? {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.objectForKey(defaultName) as String?
    }
    
    func integerForKey(defaultName: String) -> Int {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.integerForKey(defaultName)
    }

    func boolForKey(defaultName: String) -> Bool {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.boolForKey(defaultName)
    }
}
