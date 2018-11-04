//
//  HomeFlowController.swift
//  Scuto
//
//  Created by Thayallan Srinathan on 2018-10-09.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class HomeFlowController: UIViewController {
    
    private let homeTabBarController = HomeTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        add(childController: homeTabBarController)
    }
}



