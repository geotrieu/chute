//
//  JobSelectionViewController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//


import UIKit
import EasyPeasy
import Then
import Foundation

class JobSelectionViewController: UIViewController {
    
    private let headerView = HomeHeaderView()
    
    let backButtonView = JobSelectionBackButtonView()
    
    private let optionsLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.demiBold(30)
        $0.text = "Options"
    }
    
    let openButton = OpenButtonView()
    
    let closeButton = CloseButtonView()
    
    let completeButton = JobCompleteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
    }
}

extension JobSelectionViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Top(), Width(375), Height(100))
        
        view.addSubview(backButtonView)
        backButtonView.easy.layout(Top(50), Left(15), Width(30), Height(20))
        
        view.addSubview(optionsLabel)
        optionsLabel.easy.layout(Top(5).to(headerView), Left(10))
        
        view.addSubview(openButton)
        openButton.easy.layout(Width(150), Height(50), Top(20).to(optionsLabel), CenterX())
        
        view.addSubview(closeButton)
        closeButton.easy.layout(Width(150), Height(50), Top(10).to(openButton), CenterX())
        
        view.addSubview(completeButton)
        completeButton.easy.layout(Width(150), Height(50), Top(10).to(closeButton), CenterX())
        
    }
}



