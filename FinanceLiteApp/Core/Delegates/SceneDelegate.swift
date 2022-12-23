//
//  SceneDelegate.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 21.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}



