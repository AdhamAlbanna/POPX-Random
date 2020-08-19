//
//  SceneDelegate.swift
//  POPX
//
//  Created by Adham Albanna on 7/30/20.
//  Copyright © 2020 Adham Albanna. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if UserDefaults.standard.string(forKey: "usersignin") != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainCV = storyboard.instantiateViewController(identifier: "UITabBarController")
                window?.rootViewController = mainCV
            }
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        let userRef = Database.database().reference(withPath: "online")
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser!
            let currentUserRef = userRef.child(user.uid)
            currentUserRef.setValue(user.email)
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        let userRef = Database.database().reference(withPath: "online")
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser!
            let currentUserRef = userRef.child(user.uid)
            currentUserRef.removeValue()
        }
        
        
    }


}

