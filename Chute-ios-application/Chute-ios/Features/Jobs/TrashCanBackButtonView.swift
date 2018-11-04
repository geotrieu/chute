//
//  TrashCanBackButtonView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol TrashCanBackButtonDelegate: class {
    func didTapBackTrash()
}

class TrashCanBackButtonView: UIView {
    
    weak var delegate: TrashCanBackButtonDelegate?
    
    let backButtonView = UIImageView().then {
        $0.image = UIImage(named: "backIcon")
    }
    
    let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapBackTrash()
    }
    
    init(){
        super.init(frame: .zero)
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrashCanBackButtonView {
    func layoutViews(){
        addSubview(backButtonView)
        backButtonView.easy.layout(Edges())
        
        addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
    }
}


