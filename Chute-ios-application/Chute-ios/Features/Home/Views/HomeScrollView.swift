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
    
    private let newsCard1 = HomeNewsCardView(viewModel: HomeNewsCardViewModel(titleLabel: "'The most intellectual...", description: "During my years studying chimpanzees in Gombe...", imageName: "newsCard1"))
    
    private let newsCard2 = HomeNewsCardBView(viewModel: HomeNewsCardBViewModel(titleLabel: "This crab could save...", description: "Few people in the world are aware their well...", imageName: "newsCard2"))
    
    private let newsCard3 = HomeNewsCardCView(viewModel: HomeNewsCardCViewModel(titleLabel: "Antarctic's future in...", description: "A plan to turn a huge tract of pristine Antarctic...", imageName: "newsCard3"))
    
    private let newsCard4 = HomeNewsCardDView(viewModel: HomeNewsCardDViewModel(titleLabel: "UK heatwaves lasting...", description: "Heatwaves in the UK are lasting twice as long...", imageName: "newsCard4"))
    
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
        newsCard1.easy.layout(Top(10).to(trendingLabel), Width(350), Height(200), CenterX())
        
        addSubview(newsCard2)
        newsCard2.easy.layout(Top(120).to(trendingLabel), Width(350), Height(5), CenterX())
        
        addSubview(newsCard3)
        newsCard3.easy.layout(Top(240).to(trendingLabel), Width(350), Height(5), CenterX())
        
        addSubview(newsCard4)
        newsCard4.easy.layout(Top(360).to(trendingLabel), Width(350), Height(5), CenterX())
        
    }
}


