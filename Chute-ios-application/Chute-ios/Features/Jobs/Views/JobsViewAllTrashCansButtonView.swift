//
//  JobsViewAllTrashCansButtonView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol ViewAllCansDelegate: class {
    func didTapTrash()
}

class JobsViewAllTrashCansButtonView: UIView {
    
    weak var delegate: ViewAllCansDelegate?
    
    private let contentView = UIView()
    
    private let viewAllJobsLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.demiBold(20)
        $0.text = "View All Trash Cans"
    }
    
    private let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapTrash()
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

extension JobsViewAllTrashCansButtonView {
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
