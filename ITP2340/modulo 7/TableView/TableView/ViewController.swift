//
//  ViewController.swift
//  TableView
//  nombre y apellidos: Joshua Juarbe
//  código del curso: ITP2340
//  título de la tarea: Programación de aplicación móvil en Apple IOS - 2
//  fecha de entrega: mayo 3
//  descripción general: Programa en el cual se crean 3 pantallas las cuales se interconectan, especificamente son: un webbrowser y dos pantallas de aplicaciones de videojuegos.
//  Created by Joshua Miranda on 5/3/20.
//  Copyright © 2020 Joshua Miranda. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
var urlString = ""
var viewController2 : ViewController2 = ViewController2()
var image_arrays = ["img_angrybirds", "img_rogue-one", "img_nba2017", "img_callofduty", "img_watch-dog",
"img_assassins", "img_doom", "img_final-fantasy", "img_forza-horizon", "img_nfl2017", "img_wwe-2k17"]
var image_url = ["https://www.angrybirds.com/", "https://www.youtube.com/watch?v=sC9abcLLQpI",
"http://www.xbox.com/en-US/games/nba-2k17", "http://www.xbox.com/en-US/games/call-of-duty-infinite-warfare",
"http://www.xbox.com/en-US/games/watch-dogs-2", "https://www.youtube.com/watch?v=gfJVoF5ko1Y",
"https://www.playstation.com/en-us/games/doom-ps4/", "http://www.xbox.com/en-US/games/final-fantasy-xv",
"http://www.xbox.com/en-US/games/forza-horizon-3", "https://www.playstation.com/en-us/games/madden-nfl-17-ps4/", "https://www.playstation.com/en-us/games/wwe-2k17-ps4/"]
override func viewDidLoad() {
super.viewDidLoad()
// Realice cualquier configuración adicional después de cargar la vista, generalmente desde una punta.
}

override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Deseche cualquier recurso que pueda recrearse.
    
}
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell?
    let imageView = cell?.viewWithTag(1) as! UIImageView
imageView.image = UIImage(named: image_arrays[indexPath.row])
    return cell!
}
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
urlString = image_url[indexPath.row]
print("EHM tableView didSelectRowAtIndexPath() urlString --> " + urlString)
    self.performSegue(withIdentifier: "viewController2", sender: nil)
}
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return image_arrays.count
}

func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    viewController2 = segue.destination as! ViewController2
print("EHM prepareForSegue() urlString --> " + urlString)
viewController2.urlString = urlString
}
func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
print("EHM performSegueWithIdentifier() urlString --> " + urlString)
viewController2.urlString = urlString
}
}
