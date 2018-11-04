//
//  HomeViewController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeViewController: UIViewController {
    
    let statScrollView = HomeStatsScrollView()
    
    let headerView = HomeHeaderView()

    let homeScrollView = HomeScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\(homeScrollView.contentSize) ---")
        statScrollView.contentSize = CGSize(width: 980, height: 100)
        homeScrollView.contentSize = CGSize(width: 375, height: 900)
    }
}

extension HomeViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Top(), Width(375), Height(100))
        
        view.addSubview(statScrollView)
        statScrollView.easy.layout(Top(5).to(headerView), Left(), Right(), Height(100), Width(660))
        
        view.addSubview(homeScrollView)
        homeScrollView.easy.layout(Top().to(statScrollView), Height(900), Width(375), Bottom())
        
        
    }
}


