//
//  ViewController.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/18/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.facebook.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }

}

extension ViewController: WKNavigationDelegate {
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView
    }
    
}
