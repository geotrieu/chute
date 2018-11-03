//
//  HomeStatsScrollView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy

class HomeStatsScrollView: UIScrollView {
    
    let cardView = HomeTreeSavedCardView(viewModel: HomeTreeSavedCardViewModel(imageName: "treeIcon", numOfTrees: "25"))
    
    let testView = HomeCommunityMembersCardView(viewModel: HomeCommunityMembersCardViewModel(imageName: "communityMembersIcon", numOfMembers: "10 000"))
    
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
extension HomeStatsScrollView {
    func setupProperties() {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
}

// MARK: - Layout Views
extension HomeStatsScrollView {
    func layoutViews() {
        addSubview(cardView)
        cardView.easy.layout(Top(), Left(20), Width(300), Height(100))
        
        addSubview(testView)
        testView.easy.layout(Top(), Left(20).to(cardView), Width(300), Height(100))
    }
}

