//
//  AppDelegate.swift
//  Project
//
//  Created by TTN on 20/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    static var thm:String = "None"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyDiVI4Yeqp1Z2AjKwwAly21ucKqDgPdCWs")
        GMSPlacesClient.provideAPIKey("AIzaSyDiVI4Yeqp1Z2AjKwwAly21ucKqDgPdCWs")
        let navigationBarAppearace = UINavigationBar.appearance()
        FirebaseApp.configure()
        print(AppDelegate.thm)
        if (AppDelegate.thm == "Light")
        {
            navigationBarAppearace.barTintColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
            navigationBarAppearace.tintColor = UIColor.gray
        }
        else if (AppDelegate.thm == "Dark")
        {
            navigationBarAppearace.barTintColor = UIColor.green
            navigationBarAppearace.tintColor = UIColor.green
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

