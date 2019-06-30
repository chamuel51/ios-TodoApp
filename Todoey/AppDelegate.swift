//
//  AppDelegate.swift
//  Todoey
//
//  Created by chamuel castillo on 5/7/19.
//  Copyright © 2019 chamuel castillo. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

  
        
        do {
            _ = try Realm()
//            try realm.write {
//                realm.add(data)
//            }
//
        } catch {
            print("Error initializing new realm, \(error)")
        }
        
         
        
        
        return true
    }

    



}

