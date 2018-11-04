//
//  AllAvailableJobsViewController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan  on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//



import UIKit
import EasyPeasy
import Then
import Foundation

class AllAvailableJobsViewController: UIViewController {
    
    private let headerView = HomeHeaderView()
    
    let availableJobCardView = AvailableJobCardView()
    
    let backButtonView = AllAvailableJobsBackButtonView()
    
    private let JobListingsLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.demiBold(25)
        $0.text = "Jobs Available"
    }
    
    private let warningLabel = UILabel().then {
        $0.textColor = UI.Colors.red
        $0.font = UI.Font.demiBold(18)
        $0.text = "By Clicking on a Job you will claim the job duties outlined in the terms and policy"
        $0.numberOfLines = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
    }
}

extension AllAvailableJobsViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Top(), Width(375), Height(100))
        
        view.addSubview(JobListingsLabel)
        JobListingsLabel.easy.layout(Top(10).to(headerView), Left(15))
        
        view.addSubview(warningLabel)
        warningLabel.easy.layout(Top().to(JobListingsLabel), LeftMargin(15), RightMargin(15))
        
        view.addSubview(availableJobCardView)
        availableJobCardView.easy.layout(Top(20).to(warningLabel), Width(300), Height(200), CenterX())
        
        view.addSubview(backButtonView)
        backButtonView.easy.layout(Top(50), Left(15), Width(30), Height(20))
        
        
    }
}



