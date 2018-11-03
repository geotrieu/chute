//
//  HomeHotspotsCardView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeHotspotsCardView: UIView {
    
    private let contentView = UIView()
    
    
    init() {
       // self.viewModel = viewModel
        super.init(frame: .zero)
        
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Properties
extension HomeHotspotsCardView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.white
        
        contentView.layer.cornerRadius = 7.0
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 10.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}

// MARK: - Layout Views
extension HomeHotspotsCardView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Width(300), Height(300), Edges())
        
        
    }
}
