//
//  AppDelegate.swift
//  TipCalculator
//
//  Created by Main Account on 7/7/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
  var window: UIWindow?


  func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
    // Override point for customization after application launch.
    
    SimpleShare.sharedInstance().simpleShareAppID = "14266e74-4809-449c-bfcf-10d2f38c2a25"
    
    return true
  }

}

