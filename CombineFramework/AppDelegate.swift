//
//  AppDelegate.swift
//  CombineFramework
//
//  Created by Tolga İskender on 18.04.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupMainVC()
        return true
    }

    fileprivate func setupMainVC(){
        
        let mainVC = SearchVC(nibName: "SearchVC", bundle: nil)
        mainVC.title = "Movies"
        let navigationController = UINavigationController(rootViewController: mainVC)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }


}

