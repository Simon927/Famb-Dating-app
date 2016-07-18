//
//  PersonView.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// PersonView Class;
class PersonView: MDCSwipeToChooseView {
    
    var informationView: UIView!
    var nameLabel: UILabel!
    var friendLabel: ImageLabel!
    
    override init(frame: CGRect, options: MDCSwipeToChooseViewOptions!) {
        super.init(frame: frame, options: options)
        
        self.clipsToBounds = true
        self.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleBottomMargin
        
        setupImageView()
        constructInformationView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        let bottomPadding: CGFloat = 50.0
        let frame = CGRectMake(
            0,
            0,
            CGRectGetWidth(self.bounds),
            CGRectGetHeight(self.bounds) - bottomPadding)
        
        self.imageView.autoresizingMask = self.autoresizingMask;
        self.imageView.backgroundColor = UIColor.grayColor()
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.imageView.frame = frame
        self.imageView.image = UIImage(named: "finn")
    }
    
    func constructInformationView() {
        let height: CGFloat = 50.0
        let frame = CGRectMake(
            0,
            CGRectGetHeight(self.bounds) - height,
            CGRectGetWidth(self.bounds),
            height)
        
        // Information;
        informationView = UIView(frame: frame)
        informationView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleTopMargin
        informationView.backgroundColor = UIColor.whiteColor()
        informationView.clipsToBounds = true
        addSubview(informationView)
        
        // Name & Age;
        constructNameLabel()
        
        // Friends;
        constructFriendLabel()
    }
    
    func constructNameLabel() {
        let leftPadding: CGFloat = 12.0
        let frame = CGRectMake(
            leftPadding,
            0,
            floor(CGRectGetWidth(informationView.frame) / 2),
            CGRectGetHeight(informationView.frame))
        
        nameLabel = UILabel(frame: frame)
        nameLabel.text = NSString(format: "%@, %d", "Test Name", 10)
        informationView.addSubview(nameLabel)
    }
    
    func constructFriendLabel() {
        let rightPadding: CGFloat = 12.0
        let width: CGFloat = 42.0
        let frame = CGRectMake(
            CGRectGetWidth(informationView.bounds) - rightPadding - width,
            0,
            width,
            CGRectGetHeight(informationView.bounds))
        let image = UIImage(named: "img_friend") as UIImage!
        
        friendLabel = ImageLabel(frame: frame, image: image, text: "10")
        friendLabel.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
        informationView.addSubview(friendLabel)
    }
}
