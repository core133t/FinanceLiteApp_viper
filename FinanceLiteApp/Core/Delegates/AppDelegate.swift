//
//  AppDelegate.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 21.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //guard let scene = (scene as? UIWindowScene) else { return }
        //let window = UIWindow(windowScene: scene)
        let splash = SplashRouter.createModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splash
        window?.makeKeyAndVisible()
        //self.window = window
        
        return true
    }
}
