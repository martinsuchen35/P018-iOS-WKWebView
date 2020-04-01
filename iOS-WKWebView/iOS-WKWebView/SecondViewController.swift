//
//  SecondViewController.swift
//  iOS-WKWebView
//
//  Created by Chen Su on 4/3/18.
//  Copyright © 2018 Chen Su. All rights reserved.
//

import UIKit
import WebKit

class SecondViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController.add(self, name: "ChenBridge")
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "example", ofType: "html")
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        webView.load(request)
        
        webView.becomeFirstResponder()
    }

}

extension SecondViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("message.name: \(message.name)")
        print("message.body: \(message.body)")
        
        if (message.body as! String == "GET_VARIABLES") {
            let var1 = "Variable 1";
            let var2 = "Variable 2";
            let var3 = "Variable 3";
            let var4 = "Variable 4";
            
            let javascript = "loadObj('\(var1)', '\(var2)', '\(var3)', '\(var4)')";
            
            self.webView.evaluateJavaScript(javascript, completionHandler: { (result: Any?, error: Error?) in
                if error == nil {
                    print("JS execution succeeds!")
                } else {
                    print("JS execution fails! \(String(describing: error))")
                }
            })
        }
    }
}
