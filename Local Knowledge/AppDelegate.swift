//
//  AppDelegate.swift
//  Local Knowledge
//
//  Created by Dylan on 09/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    openHomeViewController()
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
  }
  
  private func openHomeViewController() {
    let homeViewController = LKHomeViewController()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = homeViewController
    window?.makeKeyAndVisible()
  }


}

