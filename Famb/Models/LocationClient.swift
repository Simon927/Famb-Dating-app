//
//  LocationClient.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// LocationClient Class;
class LocationClient: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var location: CLLocation!
    
    class var sharedClient: LocationClient {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var client: LocationClient? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.client = LocationClient()
        }
        return Static.client!
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        // Set;
        location = newLocation
        
        // Update;
        APIClient.sharedClient.updateLocation(location, completion: { (successed) -> Void in
            
        })
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
    }
    
    func startUpdatingLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if (locationManager.respondsToSelector(Selector("requestWhenInUseAuthorization"))) {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.startUpdatingLocation()
    }
}
