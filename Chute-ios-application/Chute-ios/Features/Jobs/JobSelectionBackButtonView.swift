//
//  JobSelectionBackButtonView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//


import UIKit
import EasyPeasy
import Then

protocol JobSelectionBackButtonDelegate: class {
    func didTapBackJobSelection()
}

class JobSelectionBackButtonView: UIView {
    
    weak var delegate: JobSelectionBackButtonDelegate?
    
    let backButtonView = UIImageView().then {
        $0.image = UIImage(named: "backIcon")
    }
    
    let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapBackJobSelection()
    }
    
    init(){
        super.init(frame: .zero)
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JobSelectionBackButtonView {
    func layoutViews(){
        addSubview(backButtonView)
        backButtonView.easy.layout(Edges())
        
        addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
    }
}

