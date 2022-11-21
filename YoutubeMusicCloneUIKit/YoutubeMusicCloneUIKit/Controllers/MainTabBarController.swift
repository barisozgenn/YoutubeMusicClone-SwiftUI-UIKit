//
//  MainTabBarController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        checkUserLoggedIn()
    }
    
    //MARK: - Helpers

    func configureViewControllers(){
        
        view.backgroundColor = .blue
        
        let home = templateNavigationController(title: "Home", image: "music.note.house", rootViewController: HomeViewController())
        let explore = templateNavigationController(title: "Explore", image: "safari", rootViewController: ExploreViewController())
        let library = templateNavigationController(title: "Library", image: "tray.full", rootViewController: LibraryViewController())

        viewControllers = [home, explore, library]
        
        tabBar.backgroundColor = UIColor.theme.tabBarBackgroundColor
        tabBar.barTintColor = .white // unselected
        tabBar.tintColor = .white // selected
        
    }
    
    func templateNavigationController(title: String, image: String, rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.title = title
        nav.tabBarItem.image = UIImage(systemName: image)
        nav.tabBarItem.selectedImage = UIImage(systemName: "\(image).fill")
        nav.navigationBar.barStyle = .black
        //nav.navigationBar.tintColor = .lightGray
        //nav.navigationBar.barTintColor = .white
        return nav
    }
    
    // MARK: - API
    func checkUserLoggedIn(){
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav =  UINavigationController(rootViewController: controller)
                nav.modalTransitionStyle = .coverVertical
                nav.modalPresentationStyle = .overFullScreen
            self.present(nav, animated: true)
            }
        }
    }
}
