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
    
    let headerView = HomeHeaderView()

    let scrollView = HomeStatsScrollView()
    
    let hotspotsLabel = UILabel().then {
        $0.textColor = UI.Colors.blue
        $0.font = UI.Font.demiBold(30)
        $0.text = "Hotspots"
    }
    
    let hotspotsView = HomeHotspotsCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\(scrollView.contentSize) ---")
        scrollView.contentSize = CGSize(width: 640, height: 100)
    }
}

extension HomeViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Top(), Width(375), Height(100))
        
        view.addSubview(scrollView)
        scrollView.easy.layout(Top(5).to(headerView), Left(), Right(), Height(100))
        
        view.addSubview(hotspotsLabel)
        hotspotsLabel.easy.layout(Top(15).to(scrollView), Left(20))
        
        view.addSubview(hotspotsView)
        hotspotsView.easy.layout(Top(20).to(hotspotsLabel), CenterX())
        
    }
}


