//
//  SceneDelegate.swift
//  Tamagochi
//
//  Created by 최승범 on 6/6/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController: UINavigationController
        let userName = UserData.name
        
        if userName == nil {
            UserData.saveName(value: "대장")
        }
        
        if let tamagochi = UserData.tamagochi {
            
            navigationController = UINavigationController(rootViewController: MainViewController(tamagochi: tamagochi))
            
        } else {
            
            navigationController = UINavigationController(rootViewController: PickUpViewController(type: .create))
            
        }
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontAndBorderColor]
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

