//
//  AppDelegateFactory.swift
//  Patterns
//
//  Created by Pavel Kochenda on 04.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import UIKit

enum AppDelegateFactory {
    static func makeDefault(_ window: UIWindow?) -> AppDelegateType {
        return CompositeAppDelegate(appDelegates: [StartupConfiguratorAppDelegate(window: window)] )
    }
}
