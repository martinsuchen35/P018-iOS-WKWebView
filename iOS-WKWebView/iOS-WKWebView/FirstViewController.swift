//
//  FirstViewController.swift
//  iOS-WKWebView
//
//  Created by Chen Su on 4/3/18.
//  Copyright © 2018 Chen Su. All rights reserved.
//

import UIKit
import WebKit

class FirstViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: CGRect(x: 10, y: 10, width: view.frame.width - 20, height: view.frame.height / 2))
        
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        
        self.view.addSubview(webView)
        webView.load(request)
    }

}

