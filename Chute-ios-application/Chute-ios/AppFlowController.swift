//
//  AppFlowController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan  on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit

class AppFlowController: UIViewController {
    
    private let splashViewController = SplashViewController()
    private let homeFlowController = HomeFlowController()
    private var isLoggedIn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        presentSplashViewController()
    }
}

// MARK: - SplashViewController Flow
extension AppFlowController {
    func presentSplashViewController() {
        add(childController: splashViewController)
        
        let deadline = DispatchTime.now() + 3.5
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.dismissSplashViewController()
        })
    }
    
    func dismissSplashViewController() {
        remove(childController: splashViewController)
        
        if isLoggedIn {
            startHomeFlowController()
        } else {
            startAuthFlowController()
        }
    }
}

// MARK: - Start Child FlowControllers
extension AppFlowController {
    func startHomeFlowController() {
        homeFlowController.modalTransitionStyle = .crossDissolve
        present(homeFlowController, animated: true, completion: nil)
        homeFlowController.start()
    }
    
    func startAuthFlowController() {
        // TODO
    }
}

