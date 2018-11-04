//
//  JobsViewAllJobsButtonView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol ViewAllJobsDelegate: class {
    func didTap()
}

class JobsViewAllJobsButtonView: UIView {
    
    weak var delegate: ViewAllJobsDelegate?
    
    let contentView = UIView()
    
    let viewAllJobsLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.demiBold(20)
        $0.text = "View All Jobs"
    }
    
    let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap() {
        delegate?.didTap()
    }
    
    init(){
        super.init(frame: .zero)
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JobsViewAllJobsButtonView {
    func setupProperties(){
        contentView.backgroundColor = UI.Colors.blue
        contentView.layer.cornerRadius = 25
        contentView.layer.borderColor = UI.Colors.blue.cgColor
        contentView.layer.borderWidth = 0.1
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        contentView.addSubview(viewAllJobsLabel)
        viewAllJobsLabel.easy.layout(CenterX(), CenterY())
        
        contentView.addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
        
    }
}


