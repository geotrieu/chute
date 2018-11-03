//
//  JobsViewController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class JobsViewController: UIViewController {
    
    private let headerView = HomeHeaderView()
    
    private let JobListingsLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.demiBold(25)
        $0.text = "Jobs Available"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
}

extension JobsViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Top(), Width(375), Height(100))
        
        view.addSubview(JobListingsLabel)
        JobListingsLabel.easy.layout(Top(10).to(headerView), Left(15))
    }
}



