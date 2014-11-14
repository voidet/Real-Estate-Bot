//
//  AppDelegate.swift
//  REABot
//
//  Created by Richard S on 13/11/2014.
//  Copyright (c) 2014 Wotif. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		Parse.setApplicationId("LpxxXBVjw1yjQVoOiIi7OzMThAuOZQHxjZ60OwfT", clientKey: "SNpVPmt1ymAeTnSMQ2EXJW4UX6qDTY3hDPlXdAdA")
		let settings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Badge|UIUserNotificationType.Sound|UIUserNotificationType.Alert, categories: nil)
		application.registerUserNotificationSettings(settings)
		application.registerForRemoteNotifications()
		application.applicationIconBadgeNumber = 0;
		return true
	}
	
	func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
		var currentInstallation = PFInstallation.currentInstallation()
		currentInstallation.setDeviceTokenFromData(deviceToken)
		currentInstallation.save()
	}
	
	func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
		PFPush.handlePush(userInfo)
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
		application.applicationIconBadgeNumber = 0;
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}

}