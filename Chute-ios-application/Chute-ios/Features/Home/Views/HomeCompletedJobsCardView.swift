//
//  HomeCompletedJobsCardView.swift
//  Chute-ios
//
//  Created by Salopan Vimalaruban on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeCompletedJobsCardView: UIView {
    
    private let viewModel: HomeCompletedJobsCardViewModel
    
    private let contentView = UIView()
    
    private let headerLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.demiBold(20)
        $0.text = "Completed Jobs:"
    }
    private let completedJobsImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    private let numOfCompletedJobsLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.demiBold(40)
    }
    
    init(viewModel: HomeCompletedJobsCardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        completedJobsImageView.image = UIImage(named: viewModel.imageName)
        numOfCompletedJobsLabel.text = viewModel.numOfCompletedJobs
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Properties
extension HomeCompletedJobsCardView {
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
extension HomeCompletedJobsCardView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Width(140), Height(190), Edges())
        
        contentView.addSubview(headerLabel)
        headerLabel.easy.layout(Top(5), Left(10))
        
        contentView.addSubview(numOfCompletedJobsLabel)
        numOfCompletedJobsLabel.easy.layout(Top(5).to(headerLabel), CenterX(-30))
        
        contentView.addSubview(completedJobsImageView)
        completedJobsImageView.easy.layout(Top(15).to(headerLabel), Left(15).to(numOfCompletedJobsLabel), Width(50))
    }
}


