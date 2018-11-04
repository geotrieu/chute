//
//  HomeTreeSavedCardView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeTreeSavedCardView: UIView {
    
    private let viewModel: HomeTreeSavedCardViewModel
    
    private let contentView = UIView()
    
    private let headerLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.demiBold(20)
        $0.text = "Number Of Trees Saved:"
    }
    private let treeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    private let numOfTreesLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.demiBold(40)
    }
    
    init(viewModel: HomeTreeSavedCardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        treeImageView.image = UIImage(named: viewModel.imageName)
        numOfTreesLabel.text = viewModel.numOfTrees
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Properties
extension HomeTreeSavedCardView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.blue
        contentView.layer.cornerRadius = 5.0
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}

// MARK: - Layout Views
extension HomeTreeSavedCardView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Width(140), Height(190), Edges())
        
        contentView.addSubview(headerLabel)
        headerLabel.easy.layout(Top(5), Left(10))
        
        contentView.addSubview(numOfTreesLabel)
        numOfTreesLabel.easy.layout(Top(5).to(headerLabel), CenterX(-30))
        
        contentView.addSubview(treeImageView)
        treeImageView.easy.layout(Top(15).to(headerLabel), CenterX(30), Width(50))
    }
}

