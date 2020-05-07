//
//  AppDelegate.swift
//  YotubeWebView
//
//  Created by IJ . on 2020/04/22.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
//    var windowScene: UIWindowScene?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "hasLaunched")
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        self.window?.windowScene = windowScene
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let launchStoryBoard = UIStoryboard(name: "OnScreen", bundle: nil)
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        var vc: UIViewController
        
        if launchedBefore{
            vc = mainStoryBoard.instantiateViewController(identifier: "MainVC")
            
        }else {
            vc = launchStoryBoard.instantiateViewController(identifier: "OnScreenVC")
            
        }
        UserDefaults.standard.set(true, forKey: "hasLaunched")
        
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
        
    }
    
    // MARK: UISceneSession Lifecycle
//    
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//    
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
    
    
}

