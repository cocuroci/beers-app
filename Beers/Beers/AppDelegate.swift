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

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    
    Network().request(routing: Router.list(page: 1)) { response in
      
    }
    
    return true
  }

}
