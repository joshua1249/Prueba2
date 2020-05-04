//
//  AppDelegate.swift
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

    

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Punto de anulación para la personalización después del inicio de la aplicación.
        return true
    }
    
    

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Se llama cuando se crea una nueva sesión de escena.
        // Use este método para seleccionar una configuración con la que crear la nueva escena.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

   func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
      // Se llama cuando el usuario descarta una sesión de escena.
      // Si alguna sesión se descartó mientras la aplicación no se estaba ejecutando, se llamará poco después de la aplicación: didFinishLaunchingWithOptions.
      // Use este método para liberar los recursos que eran específicos de las escenas descartadas, ya que no volverán.
    }

}


