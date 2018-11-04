//
//  AvailableTrashCanView.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//


import UIKit
import EasyPeasy
import Then


protocol valueDelegate: class {
    func reload()
}

class AvailableTrashCanView: UIView {
    
    weak var delegate: valueDelegate?
    
    let contentView = UIView()
    
    let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap() {
        delegate?.reload()
    }
    
    private let jobTitleLabel = UILabel().then {
        $0.textColor = UI.Colors.blue
        $0.font = UI.Font.medium(18)
        $0.text = "Community Park"
    }
    
    private let zeroLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.demiBold(20)
        $0.text = "0%"
    }
    
    private let hundredLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.demiBold(20)
        $0.text = "100%"
    }
    
    private let barALabel = UILabel().then {
       $0.text = ""
    }
    
    private let barBLabel = UILabel().then {
        $0.text = ""

    }
    
    private let barCLabel = UILabel().then {
        $0.text = ""

    }
    
    private let barDLabel = UILabel().then {
        $0.text = ""

    }
    
    
    init(level: String) {
        super.init(frame: .zero)
        
        if level == "F0" {
            barALabel.backgroundColor = UI.Colors.red
            barBLabel.backgroundColor = UI.Colors.red
            barCLabel.backgroundColor = UI.Colors.red
            barDLabel.backgroundColor = UI.Colors.red
        }
        else if level == "F25" {
            barALabel.backgroundColor = UI.Colors.blue
            barBLabel.backgroundColor = UI.Colors.red
            barCLabel.backgroundColor = UI.Colors.red
            barDLabel.backgroundColor = UI.Colors.red
        }
        else if level == "F50" {
            barALabel.backgroundColor = UI.Colors.blue
            barBLabel.backgroundColor = UI.Colors.blue
            barCLabel.backgroundColor = UI.Colors.red
            barDLabel.backgroundColor = UI.Colors.red
        }
        else if level == "F75" {
            barALabel.backgroundColor = UI.Colors.blue
            barBLabel.backgroundColor = UI.Colors.blue
            barCLabel.backgroundColor = UI.Colors.blue
            barDLabel.backgroundColor = UI.Colors.red
        }
        else if level == "F100" {
            barALabel.backgroundColor = UI.Colors.blue
            barBLabel.backgroundColor = UI.Colors.blue
            barCLabel.backgroundColor = UI.Colors.blue
            barDLabel.backgroundColor = UI.Colors.blue
        }
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AvailableTrashCanView {
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
        contentView.easy.layout(Edges(), Width(300), Height(200))
        
        contentView.addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
        
        contentView.addSubview(jobTitleLabel)
        jobTitleLabel.easy.layout(Top(5), Left(5))
        
        contentView.addSubview(zeroLabel)
        zeroLabel.easy.layout(Top(15).to(jobTitleLabel), Left(5))
        
        contentView.addSubview(hundredLabel)
        hundredLabel.easy.layout(Top(15).to(jobTitleLabel), Right(5))
        
        contentView.addSubview(barALabel)
        barALabel.easy.layout(Top(5).to(zeroLabel), Left(10), Width(70), Height(40))
        
        contentView.addSubview(barBLabel)
        barBLabel.easy.layout(Top(5).to(zeroLabel), Left().to(barALabel), Width(70), Height(40))
        
        contentView.addSubview(barCLabel)
        barCLabel.easy.layout(Top(5).to(zeroLabel), Left().to(barBLabel), Width(70), Height(40))
        
        contentView.addSubview(barDLabel)
        barDLabel.easy.layout(Top(5).to(zeroLabel), Left().to(barCLabel), Width(70), Height(40))
        
 
        
    }
}


