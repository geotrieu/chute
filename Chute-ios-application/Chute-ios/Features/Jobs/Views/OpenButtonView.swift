//
//  OpenButtonView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol openCanDelegate: class {
    func didTapOpen()
}
class OpenButtonView: UIView {
    
    weak var delegate: openCanDelegate?
    
    let contentView = UIView()
    
    private let openLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.demiBold(16)
        $0.text = "OPEN"
    }
    
    private let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapOpen()
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

extension OpenButtonView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.blue
        contentView.layer.cornerRadius = 25
        contentView.layer.borderColor = UI.Colors.blue.cgColor
        contentView.layer.borderWidth = 0.1
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Width(150), Height(50))
        
        contentView.addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
        
        contentView.addSubview(openLabel)
        openLabel.easy.layout(CenterX(), CenterY())
    }
}
