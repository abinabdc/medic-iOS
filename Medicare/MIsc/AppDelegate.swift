//
//  AppDelegate.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//
//

import UIKit
import CoreData


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let userDefaults = UserDefaults.standard
        userDefaults.register(defaults: [
            "access_token": "NA"
        ])
        if (userDefaults.string(forKey: "access_token")! == "NA"){
            
            let nav1 = UINavigationController()
            let mainView = LoginViewController()
            nav1.viewControllers = [mainView]
            window?.makeKeyAndVisible()
            window?.backgroundColor = .systemBackground
            window?.rootViewController = nav1
        }else{
            LoginViewController.loginSuccessHandler()
        }
        
        
        
        
        
        
        print(userDefaults.string(forKey: "access_token")!)
        return true
    }

}
