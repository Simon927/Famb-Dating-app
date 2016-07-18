//
//  ImageLabel.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// PersonView Class;
class ImageLabel: UIView {
    
    var imageView: UIImageView!
    var textLabel: UILabel!
    
    init(frame: CGRect, image: UIImage, text: String) {
        super.init(frame: frame)
        
        constructImageView(image)
        constructTextLabel(text)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constructImageView(image: UIImage) {
        let topPadding: CGFloat = 4.0
        let frame = CGRectMake(
            (CGRectGetWidth(bounds) - image.size.width) / 2,
            topPadding,
            image.size.width,
            image.size.height)
        
        // Information;
        imageView = UIImageView(frame: frame)
        imageView.image = image
        addSubview(imageView)
    }
    
    func constructTextLabel(text: String) {
        let height: CGFloat = 18.0
        let frame = CGRectMake(
            0,
            CGRectGetMaxY(imageView.frame),
            CGRectGetWidth(bounds),
            height)
        
        textLabel = UILabel(frame: frame)
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.text = text
        addSubview(textLabel)
    }
}
