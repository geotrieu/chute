//
//  AvailableJobCardView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol JobSelectionDelegate: class {
    func didTapCardSelection()
}

class AvailableJobCardView: UIView {
    
    weak var delegate: JobSelectionDelegate?
    
    private let contentView = UIView()
    
    let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapCardSelection()
    }
    
    private let jobTitleLabel = UILabel().then {
        $0.textColor = UI.Colors.blue
        $0.font = UI.Font.medium(30)
        $0.text = "Community Park"
    }
    
    private let locationLabel = UILabel().then {
        $0.textColor = UI.Colors.lightGrey
        $0.font = UI.Font.medium(20)
        $0.text = "Peterborough, ON"
    }
    
    private let statusImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let statusLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.regular(5)
    }
    
    init() {
        super.init(frame: .zero)
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AvailableJobCardView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.white
        contentView.layer.cornerRadius = 5.0
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 10.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
    }
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Width(300), Height(75))
        
        contentView.addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
        
        contentView.addSubview(jobTitleLabel)
        jobTitleLabel.easy.layout(Top(5), Left(5))
        
        contentView.addSubview(locationLabel)
        locationLabel.easy.layout(Top().to(jobTitleLabel), Left(5))
    }
}
