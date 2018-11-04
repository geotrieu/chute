//
//  HomeNewsCardView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeNewsCardView: UIView {
    
    private let viewModel: HomeNewsCardViewModel
    
    private let contentView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.textColor = UI.Colors.blue
        $0.font = UI.Font.demiBold(25)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.textColor = UI.Colors.lightGrey
        $0.font = UI.Font.regular(20)
        $0.numberOfLines = 0
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    
    init(viewModel: HomeNewsCardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        titleLabel.text = viewModel.titleLabel
        imageView.image = UIImage(named: viewModel.imageName)
        descriptionLabel.text = viewModel.description
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Properties
extension HomeNewsCardView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.white
        contentView.layer.cornerRadius = 5.0
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 10.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}

// MARK: - Layout Views
extension HomeNewsCardView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Width(350), Height(200))
        
        contentView.addSubview(titleLabel)
        titleLabel.easy.layout(Top(5), LeftMargin(5), RightMargin(50))
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.easy.layout(Top(10).to(titleLabel), LeftMargin(5), RightMargin(50))
       
    }
}



