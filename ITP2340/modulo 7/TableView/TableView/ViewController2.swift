//
//  ViewController2.swift
//  TableView
//  nombre y apellidos: Joshua Juarbe
//  código del curso: ITP2340
//  título de la tarea: Programación de aplicación móvil en Apple IOS - 2
//  fecha de entrega: mayo 3
//  descripción general: Programa en el cual se crean 3 pantallas las cuales se interconectan, especificamente son: un webbrowser y dos pantallas de aplicaciones de videojuegos.
//  Created by Joshua Miranda on 5/3/20.
//  Copyright © 2020 Joshua Miranda. All rights reserved.
//

import Foundation
import UIKit
class ViewController2: UIViewController {
    
    @IBOutlet var webview: UIWebView!
    var urlString = String()
    //configuracion para ir a una pagina web
func loadAddressURL() {
let requestURL = NSURL (string: urlString)
    let request = NSURLRequest(url: requestURL! as URL)
self.webview.layoutIfNeeded()
    self.webview.scrollView.isScrollEnabled = true
    webview.loadRequest(request as URLRequest)
}
override func viewDidLoad() {
super.viewDidLoad()
loadAddressURL()
}
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
}
}
