//
//  HomeHeaderView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeHeaderView: UIView {
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "chuteHeaderLogo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let dividerLine = UILabel().then {
        $0.backgroundColor = UI.Colors.lightGrey
    }
    
    init(){
        super.init(frame: .zero)
        layoutViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    func layoutViews() {
        addSubview(logoImage)
        logoImage.easy.layout(Top(5), CenterX(), Width(150))
        
        addSubview(dividerLine)
        dividerLine.easy.layout(Top(90), Width(375), Height(1))
    }
}
