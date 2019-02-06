//
//  AppDelegate.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureServices()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = HomeModuleAssembly.createModule()
        window?.makeKeyAndVisible()
        
        let familyNames = UIFont.familyNames
        
        for family in familyNames {
            print("Family name " + family)
            let fontNames = UIFont.fontNames(forFamilyName: family)
            
            for font in fontNames {
                print("    Font name: " + font)
            }
        }
        
        return true
    }
    
    // MARK: - Private methods
    
    private func configureServices() {
        FirebaseApp.configure()
    }
}
