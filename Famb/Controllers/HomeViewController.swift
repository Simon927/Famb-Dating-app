//
//  HomeViewController.swift
//  Famb
//
//  Created by Wang Jin on 13/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// HomeViewController Class;
class HomeViewController: UIViewController, MDCSwipeToChooseDelegate {
    
    @IBOutlet var contentView: UIView!
    
    var frontView: PersonView!
    var backView: PersonView!
    
    @IBOutlet var searchView: UIView!
    @IBOutlet var animationView: UIImageView!
    @IBOutlet var avatarView: UIImageView!
    
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        frontView = popPersonViewWithFrame(frontViewFrame())
        contentView.addSubview(frontView)
        
        backView = popPersonViewWithFrame(backViewFrame())
        contentView.insertSubview(backView, belowSubview: frontView)
        
        avatarView.layer.borderColor = UIColor.whiteColor().CGColor
        avatarView.layer.borderWidth = 2.0
        avatarView.layer.cornerRadius = avatarView.bounds.size.width / 2
        
//        let url = NSURL(string: Account.me.avatar) as NSURL!
//        avatarView.sd_setImageWithURL(url, placeholderImage: nil)
        
        // Start Animating;
        startAnimating()
        
        NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("stopAnimating"), userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func viewDidCancelSwipe(view: UIView!) {
        
    }
    
    func view(view: UIView!, shouldBeChosenWithDirection direction: MDCSwipeDirection) -> Bool {
        return true
    }
    
    func view(view: UIView!, wasChosenWithDirection direction: MDCSwipeDirection) {
        if direction == MDCSwipeDirection.Left {
            
        } else {
            
        }
        
        frontView = backView;
        backView = popPersonViewWithFrame(backViewFrame())
        
        if (backView != nil) {
            backView.alpha = 0.0
            contentView.insertSubview(backView, belowSubview: frontView)
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.backView.alpha = 1.0
                }, completion: { (Bool) -> Void in
                    
            })
        }
    }
    
    func setFrontView(view: PersonView!) {
        frontView = view
    }
    
    func popPersonViewWithFrame(frame: CGRect) -> PersonView {
        var options: MDCSwipeToChooseViewOptions! = MDCSwipeToChooseViewOptions()
        options.delegate = self;
        options.threshold = 64.0;
        options.onPan = {(state: MDCPanState!) -> Void in
            let horizontalPadding: CGFloat = 10.0
            let verticalPadding: CGFloat = 10.0
            let frame: CGRect = self.backViewFrame()
            
            self.backView.frame = CGRectMake(
                frame.origin.x - state.thresholdRatio * horizontalPadding,
                frame.origin.y + state.thresholdRatio * verticalPadding,
                CGRectGetWidth(frame) + state.thresholdRatio * horizontalPadding * 2,
                CGRectGetHeight(frame) + state.thresholdRatio * verticalPadding * 2)
        }
        
        var view: PersonView! = PersonView(frame: frame, options: options)
        return view
    }
    
    func frontViewFrame() -> CGRect {
        let horizontalPadding: CGFloat = 20.0
        let verticalPadding: CGFloat = 20.0
        
        return CGRectMake(
            horizontalPadding,
            verticalPadding,
            CGRectGetWidth(contentView.frame) - horizontalPadding * 2,
            CGRectGetHeight(contentView.frame) - verticalPadding)
    }
    
    func backViewFrame() -> CGRect {
        let horizontalPadding: CGFloat = 10.0
        let verticalPadding: CGFloat = 10.0
        let frame: CGRect = frontViewFrame()
        
        return CGRectMake(
            frame.origin.x + horizontalPadding,
            frame.origin.y - verticalPadding,
            CGRectGetWidth(frame) - horizontalPadding * 2,
            CGRectGetHeight(frame) - verticalPadding)
    }
    
    func searchAnimation() {
        let radius: CGFloat = min(CGRectGetWidth(animationView.frame), CGRectGetHeight(animationView.frame))
        let frame: CGRect = CGRectMake(-radius, -radius, radius * 2, radius * 2)
        let path: UIBezierPath = UIBezierPath(roundedRect: frame, cornerRadius: radius)
        
        // Shape;
        let shape: CAShapeLayer = CAShapeLayer()
        shape.path = path.CGPath
        shape.position = avatarView.center
        shape.fillColor = UIColor(red: 207.0/255.0, green: 237.0/255.0, blue: 255.0/255.0, alpha: 1.0).CGColor
        shape.opacity = 0.0
        shape.strokeColor = UIColor(red: 163.0/255.0, green: 215.0/255.0, blue: 247.0/255.0, alpha: 1.0).CGColor
        shape.lineWidth = 2.0
        animationView.layer.addSublayer(shape)
        
        // Scale Animation;
        let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = NSValue(CATransform3D: CATransform3DMakeScale(0.1, 0.1, 1));
        scaleAnimation.toValue = NSValue(CATransform3D: CATransform3DIdentity)
        
        // Alpha Animation;
        let alphaAnimation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 1
        alphaAnimation.toValue = 0
        
        // Animation Group;
        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [scaleAnimation, alphaAnimation]
        animationGroup.duration = 3
        animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        // Add Animation;
        shape.addAnimation(animationGroup, forKey: nil)
    }
    
    func startAnimating() {
        if (timer == nil) {
            searchView.hidden = false
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("searchAnimation"), userInfo: nil, repeats: true)
        }
    }
    
    func stopAnimating() {
        if (timer != nil) {
            searchView.hidden = true
            
            timer.invalidate()
            timer = nil
        }
    }
    
    @IBAction func onBtnMenu(sender: AnyObject) {
        self.slidingViewController().anchorTopViewToRightAnimated(true)
    }
    
    @IBAction func onBtnNo(sender: AnyObject) {
        frontView.mdc_swipe(MDCSwipeDirection.Left)
    }
    
    @IBAction func onBtnInfo(sender: AnyObject) {
        
    }
    
    @IBAction func onBtnYes(sender: AnyObject) {
        frontView.mdc_swipe(MDCSwipeDirection.Right)
    }
    
    @IBAction func onBtnInvite(sender: AnyObject) {
        let activityItems = ["This is to share!"]
        let activities = []
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: activities)
        self.presentViewController(activityController, animated: true, completion: nil)
    }
}