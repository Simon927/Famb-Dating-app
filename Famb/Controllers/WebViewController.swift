//
//  WebViewController.swift
//  Famb
//
//  Created by Wang Jin on 14/10/14.
//  Copyright (c) 2014 Wang Jin. All rights reserved.
//
// --- Headers ---;
import UIKit

// --- Defines ---;
// WebViewController Class;
class WebViewController: UIViewController, UIWebViewDelegate {

    var url: NSURL!
    
    @IBOutlet var contentView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlRequest = NSURLRequest(URL: url)
        contentView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        contentView.stringByEvaluatingJavaScriptFromString("document.body.style.background = 'rgba(0,0,0,0)';")
    }
}
