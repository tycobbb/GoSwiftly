//
//  AppDelegate.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit
import CloudKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        
        let notificationSettings = UIUserNotificationSettings(forTypes: .Badge | .Sound | .Alert, categories: nil)
        application.registerUserNotificationSettings(notificationSettings)
        application.registerForRemoteNotifications()

        Logger.singleton.state     = LogState.Info
        Records.singleton.adapater = ParseAdapter()
        
//        CKContainer.defaultContainer().requestApplicationPermission(.PermissionUserDiscoverability) {
//            status, error in
//            println("application permission: \(status) error: \(error?.localizedDescription)")
//        }
//        
//        CKContainer.defaultContainer().accountStatusWithCompletionHandler {
//            status, error in
//            println("account status: \(status) error: \(error?.localizedDescription)")
//        }        
        
        return true
    }
    
    //
    // MARK: Notifications
    //
    
    func application(application: UIApplication!, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings!) {
    
    }
    
    func application(application: UIApplication!, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData!) {

    }
    
    func application(application: UIApplication!, didFailToRegisterForRemoteNotificationsWithError error: NSError!) {

    }
    
    func application(application: UIApplication!, didReceiveRemoteNotification userInfo: NSDictionary!) {
        var notification = CKNotification(fromRemoteNotificationDictionary: userInfo)
        println("notification: \(notification)")
    }

}

