//
//  UserMainTabController.swift
//  Scuto
//
//  Created by Thayallan Srinathan on 2018-10-06.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    let csvc1 = ComingSoonViewController()
    let csvc2 = ComingSoonViewController()
    let csvc3 = ComingSoonViewController()
    let csvc4 = ComingSoonViewController()
    let csvc5 = ComingSoonViewController()
    let homeViewController = HomeViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarProperties()
        setupViewControllers()
        
    }
}

extension HomeTabBarController {
    func setupTabBarProperties() {
        let attributes: [NSAttributedString.Key: Any] = [.font: UI.Font.tabBarMenu]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: UIControl.State.normal)
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UI.Colors.white
        tabBar.layer.borderWidth = 0.1
    }
}

// MARK: - Setup TabBar View Controllers
extension HomeTabBarController {
    func setupViewControllers() {
        let vc1 = createFirstViewController()
        let vc2 = createSecondViewController()
        let vc3 = createThirdViewController()
        
        
        self.viewControllers = [vc1, vc2, vc3]
        
        selectedIndex = 0
    }
    
    func createFirstViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: homeViewController)
        navigationVC = setupTabBarItem(for: navigationVC, title: "HOME", imageName: "homeIcon", selectedImageName: "")
        return navigationVC
    }
    
    func createSecondViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: csvc2)
        navigationVC = setupTabBarItem(for: navigationVC, title: "JOBS", imageName: "jobsIcon", selectedImageName: "")
        return navigationVC
    }
    
    func createThirdViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: csvc3)
        navigationVC = setupTabBarItem(for: navigationVC, title: "MY ACCOUNT", imageName: "myAccountIcon", selectedImageName: "")
        return navigationVC
    }
    
    func setupTabBarItem(for navigationController: ScutoNavigationController, title: String, imageName: String, selectedImageName: String) -> ScutoNavigationController {
        let image = UIImage(named: imageName), selectedImage = UIImage(named: selectedImageName)
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return navigationController
    }
}

