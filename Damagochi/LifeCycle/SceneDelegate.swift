//
//  SceneDelegate.swift
//  Damagochi
//
//  Created by 최승범 on 6/6/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController: UINavigationController
        let decoder = JSONDecoder()
        let userName = UserData.name
        
        if userName == nil {
            UserData.saveName(value: "대장님")
        }
        
        if let damagochi = UserData.damagochi {
            
            navigationController = UINavigationController(rootViewController: MainViewController(damagochi: damagochi))
            
        } else {
            
            navigationController = UINavigationController(rootViewController: PickUpViewController())
            
        }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
    
}

