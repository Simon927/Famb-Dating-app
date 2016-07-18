//
//  DiscoverSettingController.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// DiscoverSettingController Class;
class DiscoverSettingController: UITableViewController {

    @IBOutlet var discoverSwitch: UISwitch!
    
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var distanceSlider: UISlider!
    
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var ageSlider: NMRangeSlider!
    
    @IBOutlet var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Distance;
        distanceSlider.value = distanceSlider.maximumValue
        
        // Age;
        ageSlider.minimumValue = 0
        ageSlider.maximumValue = 32
        ageSlider.lowerValue = 0
        ageSlider.upperValue = 32
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onDistanceChanged(sender: AnyObject) {
        let distance = Int(distanceSlider.value)
        distanceLabel.text = String(format: "%dkm.", distance)
    }

    @IBAction func onAgeChanged(sender: AnyObject) {
        let lower = Int(ageSlider.lowerValue) + 18
        let upper = Int(ageSlider.upperValue) + 18
        ageLabel.text = String(format: "%d-%d", lower, upper)
    }
}
