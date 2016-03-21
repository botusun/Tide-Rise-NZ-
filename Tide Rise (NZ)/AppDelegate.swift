//
//  AppDelegate.swift
//  Tide Rise (NZ)
//
//  Created by Botu Sun on 21/03/16.
//  Copyright © 2016 Botu Sun. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        let naviController = UINavigationController(rootViewController: mapViewController())
        self.window!.rootViewController = naviController
        naviController.navigationBar.topItem?.title = "Tide Rise (NZ)"
        self.window!.makeKeyAndVisible()
        return true
    }
}

