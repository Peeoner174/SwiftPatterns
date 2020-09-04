//
//  StartupConfiguratorAppDelegate.swift
//  Patterns
//
//  Created by Pavel Kochenda on 04.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import UIKit

class StartupConfiguratorAppDelegate: AppDelegateType {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
