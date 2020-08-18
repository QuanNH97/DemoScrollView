//
//  ViewController.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/18/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string:"https://www.facebook.com/")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

}

