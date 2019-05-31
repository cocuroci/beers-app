//
//  AppDelegate.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var coordinator: Coordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    let appCoordinator = AppCoordinator(window: window)
    
    self.coordinator = appCoordinator
    self.coordinator?.start()
    
    self.window = window
    self.window?.makeKeyAndVisible()
    
    return true
  }
}
