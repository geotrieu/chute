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
import Foundation

class JobsViewController: UIViewController {
    
    private let headerView = HomeHeaderView()
    
    //private let server = MosquittoServer()
    
    //let availableJobCardView = AvailableJobCardView()
    
    private let JobListingsLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.demiBold(25)
        $0.text = "Jobs Available"
    }
    
    private let communityTrashCansLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.demiBold(25)
        $0.text = "Community Trash Cans"
    }
    
    //let trashCanStatusView = AvailableTrashCanView()
    
    let viewAllJobsButtonView = JobsViewAllJobsButtonView()
    
    let viewAllTrashCansButtonView = JobsViewAllTrashCansButtonView()
    
    let openButton = OpenButtonView()
    
    let closeButton = CloseButtonView()

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
        
        //view.addSubview(availableJobCardView)
        //availableJobCardView.easy.layout(Width(300), Height(75), Top(20).to(JobListingsLabel), CenterX())
        
        view.addSubview(viewAllJobsButtonView)
        viewAllJobsButtonView.easy.layout(Top(20).to(JobListingsLabel),Width(200), Height(50), CenterX())
        
        view.addSubview(communityTrashCansLabel)
        communityTrashCansLabel.easy.layout(CenterY(-100), Left(15))
        
        view.addSubview(viewAllTrashCansButtonView)
        viewAllTrashCansButtonView.easy.layout(Top(20).to(communityTrashCansLabel), Width(200), Height(50), CenterX())
        
        //view.addSubview(trashCanStatusView)
        //trashCanStatusView.easy.layout(Top(20).to(communityTrashCansLabel), Width(300), Height(200), CenterX())
    }
}



