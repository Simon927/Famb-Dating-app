//
//  APIClient.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// API Base URL;
let kAPIBaseURLString = "http://famb.hongjisoft.com"

// APIClient Class;
class APIClient: AFHTTPSessionManager {
    class var sharedClient: APIClient {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var client: APIClient? = nil
        }
        dispatch_once(&Static.onceToken) {
            let url = NSURL(string: kAPIBaseURLString)
            Static.client = APIClient(baseURL: url)
            
            // Response;
            let responseSerializer = AFJSONResponseSerializer()
            responseSerializer.acceptableContentTypes = NSSet(object: "text/html")
            Static.client?.responseSerializer = responseSerializer
        }
        return Static.client!
    }
    
    func GET(urlString: String!, parameters: AnyObject!, completion: ((AnyObject!, NSError!) -> Void)!) {
        GET(urlString, parameters: parameters, success: { (task: NSURLSessionDataTask!, responseObject: AnyObject!) -> Void in
            if (completion != nil) {
                completion(responseObject, nil)
            }
            }, failure: { (task: NSURLSessionDataTask!, error: NSError!) -> Void in
            if (completion != nil) {
                completion(nil, error)
            }
        })
    }
    
    func POST(urlString: String!, parameters: AnyObject!, completion: ((AnyObject!, NSError!) -> Void)!) {
        POST(urlString, parameters: parameters, success: { (task: NSURLSessionDataTask!, responseObject: AnyObject!) -> Void in
            if (completion != nil) {
                completion(responseObject, nil)
            }
        }, failure: { (task: NSURLSessionDataTask!, error: NSError!) -> Void in
            if (completion != nil) {
                completion(nil, error)
            }
        })
    }
    
    func POST(urlString: String!, parameters: AnyObject!, constructingBodyWithBlock block: ((AFMultipartFormData!) -> Void)!, completion: ((AnyObject!, NSError!) -> Void)!) {
        POST(urlString, parameters: parameters, constructingBodyWithBlock: block, success: { (task: NSURLSessionDataTask!, responseObject: AnyObject!) -> Void in
            if (completion != nil) {
                completion(responseObject, nil)
            }
        }, failure: { (task: NSURLSessionDataTask!, error: NSError!) -> Void in
            if (completion != nil) {
                completion(nil, error)
            }
        })
    }
    
    func loginWithFacebook(name: String!, firstname: String!, lastname: String!, birthday: String!, gender: String!, email: String!, facebookId: String!, facebookToken: String!, completion: ((successed: Bool) -> Void)!) {
        // Parameters;
        let parameters = [
            "action": "login_with_facebook",
            "name": name != nil ? name : "",
            "name": firstname != nil ? firstname : "",
            "name": lastname != nil ? lastname : "",
            "email": email != nil ? email : "",
            "gender": gender,
            "facebook_id": facebookId,
            "facebook_token": facebookToken
        ]
        
        // Post;
        POST("index.php", parameters: parameters, completion: { (responseObject: AnyObject!, error: NSError!) -> Void in
            if (error == nil) {
                Account.me.setAttributes(responseObject["user"])
            }
            
            if (completion != nil) {
                completion(successed: (error == nil))
            }
        })
    }
    
    func updateLocation(location: CLLocation!, completion: ((successed: Bool) -> Void)!) {
        // Parameters;
        let parameters = [
            "action": "update_location",
            "id": Account.me.id,
            "latitude": location.coordinate.latitude,
            "longitude": location.coordinate.longitude
        ]
        
        // Post;
        POST("index.php", parameters: parameters, completion: { (responseObject: AnyObject!, error: NSError!) -> Void in
            if (error == nil) {
                
            }
            
            if (completion != nil) {
                completion(successed: (error == nil))
            }
        })
    }
    
    func updateDiscovery(completion: ((successed: Bool) -> Void)!) {
        // Parameters;
        let parameters = [
            "action": "update_discovery",
            "id": Account.me.id
        ]
        
        // Post;
        POST("index.php", parameters: parameters, completion: { (responseObject: AnyObject!, error: NSError!) -> Void in
            if (error == nil) {
                Account.me.setAttributes(responseObject["user"])
            }
            
            if (completion != nil) {
                completion(successed: (error == nil))
            }
        })
    }
    
    func updatePreferences(completion: ((successed: Bool) -> Void)!) {
        // Parameters;
        let parameters = [
            "action": "update_preferences",
            "id": Account.me.id            
/*          "discovery": discovery,
            "distance": distance,
            "age_min": min,
            "age_max": max,
            "show": show */
        ]
        
        // Post;
        POST("index.php", parameters: parameters, completion: { (responseObject: AnyObject!, error: NSError!) -> Void in
            if (error == nil) {
                Account.me.setAttributes(responseObject["user"])
            }
            
            if (completion != nil) {
                completion(successed: (error == nil))
            }
        })
    }
    
    func getMatches(completion: ((successed: Bool) -> Void)!) {
        // Parameters;
        let parameters = [
            "action": "update_preferences",
            "id": Account.me.id,
            "latitude": LocationClient.sharedClient.location.coordinate.latitude,
            "longitude": LocationClient.sharedClient.location.coordinate.longitude,
            "discovery": Account.me.discovery,
            "distance": Account.me.distance,
            "age_min": Account.me.minOfAge,
            "age_max": Account.me.maxOfAge,
            "show": Account.me.show
        ]
        
        // Post;
        POST("index.php", parameters: parameters, completion: { (responseObject: AnyObject!, error: NSError!) -> Void in
            if (error == nil) {
                Account.me.setAttributes(responseObject["user"])
            }
            
            if (completion != nil) {
                completion(successed: (error == nil))
            }
        })
    }
    
    func like(completion: ((successed: Bool) -> Void)!) {
        // Parameters;
        let parameters = [
            "action": "update_preferences",
            "id": Account.me.id
        ]
        
        // Post;
        POST("index.php", parameters: parameters, completion: { (responseObject: AnyObject!, error: NSError!) -> Void in
            if (error == nil) {
                Account.me.setAttributes(responseObject["user"])
            }
            
            if (completion != nil) {
                completion(successed: (error == nil))
            }
        })
    }
    
    func dislike(completion: ((successed: Bool) -> Void)!) {
        // Parameters;
        let parameters = [
            "action": "update_preferences",
            "id": Account.me.id
        ]
        
        // Post;
        POST("index.php", parameters: parameters, completion: { (responseObject: AnyObject!, error: NSError!) -> Void in
            if (error == nil) {
                Account.me.setAttributes(responseObject["user"])
            }
            
            if (completion != nil) {
                completion(successed: (error == nil))
            }
        })
    }
}
