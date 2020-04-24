//
//  ViewController.swift
//  YouTube
//
//  Created by Joshua Miranda on 4/23/20.
//  Copyright © 2020 Joshua Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    var videourlpath = "https://www.youtube.com"
    func loadAddressURL(){
        let requestURL = URL (string: videourlpath)
        
        let request = URLRequest(url: requestURL!)
        
        self.webview.layoutIfNeeded()
        self.webview.scrollView.isScrollEnabled = true
        
        webview.loadRequest(request)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressURL()
        // Do any additional setup after loading the view.
    }


}

