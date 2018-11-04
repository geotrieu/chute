//
//  JobsFlowController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//


import UIKit

class JobsFlowController: UIViewController {
    
    private let jobsViewController = JobsViewController()
    private let server = MosquittoServerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start()
    }
    
    func start() {
        add(childController: jobsViewController)
        add(childController: server)
    }
}

