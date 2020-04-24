//
//  ViewController.swift
//  Modulo 5
//Joshua Juarbe - ITP2340 - EDP University
//  Created by Joshua Miranda on 4/23/20.
//  Copyright © 2020 Joshua Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var urlpath = "https://google.com"
    
    func loadaddressURL(){
        let requestURL = NSURL (string: urlpath)
        let request = NSURLRequest(url: requestURL! as URL)
        webview.loadRequest(request as URLRequest)
    }

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadaddressURL()
        // Do any additional setup after loading the view.
    }


}

