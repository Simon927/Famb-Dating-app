//
//  SlidingViewController.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// SlidingViewController Class;
class SlidingViewController: ECSlidingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sliding;
        self.anchorRightRevealAmount = 260.0
        self.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesture.Tapping | ECSlidingViewControllerAnchoredGesture.Panning
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
}
