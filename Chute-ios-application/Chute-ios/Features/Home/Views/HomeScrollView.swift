//
//  HomeScrollView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy

class HomeScrollView: UIScrollView {
    
    private let hotspotsLabel = UILabel().then {
        $0.textColor = UI.Colors.blue
        $0.font = UI.Font.demiBold(30)
        $0.text = "Hotspots"
    }
    
    private let hotspotsView = HomeHotspotsCardView()
    
    private let trendingLabel = UILabel().then {
        $0.textColor = UI.Colors.blue
        $0.font = UI.Font.demiBold(30)
        $0.text = "Trending"
    }
    
    private let newsCard1 = HomeNewsCardView(viewModel: HomeNewsCardViewModel(titleLabel: "", description: "", imageName: ""))
    
    init() {
        super.init(frame: .zero)
        layoutViews()
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Properties
extension HomeScrollView {
    func setupProperties() {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
}

// MARK: - Layout Views
extension HomeScrollView {
    func layoutViews() {
       
        addSubview(hotspotsLabel)
        hotspotsLabel.easy.layout(Top(), Left(20))
        
        addSubview(hotspotsView)
        hotspotsView.easy.layout(Top(20).to(hotspotsLabel), CenterX())
        
        addSubview(trendingLabel)
        trendingLabel.easy.layout(Top(20).to(hotspotsView), Left(20))
        
        addSubview(newsCard1)
        newsCard1.easy.layout(Top(20).to(trendingLabel), Width(350), Height(200), CenterX())
        
    }
}


