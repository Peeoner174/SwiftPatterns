//
//  CompositeAppDelegate.swift
//  Patterns
//
//  Created by Pavel Kochenda on 04.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

/*
 Позволяет сгруппировать объекты в древовидную структуру, а затем работать с ними так, как будто это единичный объект.
 */

import UIKit

typealias AppDelegateType = UIResponder & UIApplicationDelegate

class CompositeAppDelegate: AppDelegateType {
    private let appDelegates: [AppDelegateType]
    
    init(appDelegates: [AppDelegateType]) {
        self.appDelegates = appDelegates
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        appDelegates.forEach { _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) }
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        appDelegates.forEach { $0.applicationWillEnterForeground?(application) }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        appDelegates.forEach { $0.applicationDidBecomeActive?(application) }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        appDelegates.forEach { $0.applicationWillResignActive?(application) }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appDelegates.forEach { _ = $0.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken) }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        appDelegates.forEach { $0.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler) }
    }
}
