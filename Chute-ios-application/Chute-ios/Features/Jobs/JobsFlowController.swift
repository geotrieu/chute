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
    private let mosquittoServer = MosquittoServerController()
    private let allAvailableJobsController = AllAvailableJobsViewController()
    private let jobSelectionController = JobSelectionViewController()
    private let trashCanController = AllTrashCansViewController()
    private let trashCanController2 = AllTrashCansViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobSelectionController.openButton.delegate = self
        jobSelectionController.closeButton.delegate = self
        jobsViewController.viewAllJobsButtonView.delegate = self
        allAvailableJobsController.availableJobCardView.delegate = self
        allAvailableJobsController.backButtonView.delegate = self
        jobSelectionController.backButtonView.delegate = self
        jobSelectionController.completeButton.delegate = self
        jobsViewController.viewAllTrashCansButtonView.delegate = self
        trashCanController.backButtonView.delegate = self
        
        start()
    }
    
    func start() {
        add(childController: jobsViewController)
    }
}

extension JobsFlowController: openCanDelegate {
    func didTapOpen() {
        add(childController: server)
        mosquittoServer.open()
        remove(childController: server)
    }
}

extension JobsFlowController: closeCanDelegate {
    func didTapClose() {
        add(childController: server)
        mosquittoServer.close()
        remove(childController: server)
    }
}

extension JobsFlowController: ViewAllJobsDelegate {
    func didTap() {
        remove(childController: jobsViewController)
        add(childController: allAvailableJobsController)
    }
}

extension JobsFlowController: JobSelectionDelegate {
    func didTapCardSelection() {
        remove(childController: allAvailableJobsController)
        add(childController: jobSelectionController)
    }
}

extension JobsFlowController: AvailableJobsBackButtonDelegate {
    func didTapBackAvailableJobs() {
        remove(childController: allAvailableJobsController)
        add(childController: jobsViewController)
    }
}

extension JobsFlowController: JobSelectionBackButtonDelegate {
    func didTapBackJobSelection() {
        remove(childController: jobSelectionController)
        add(childController: allAvailableJobsController)
    }
}

extension JobsFlowController: completedDelegate {
    func didTapCompleted() {
        add(childController: server)
        server.auto()
        remove(childController: server)
        remove(childController: jobSelectionController)
        add(childController: jobsViewController)
    }
}

extension JobsFlowController: ViewAllCansDelegate {
    func didTapTrash() {
        remove(childController: jobsViewController)
        add(childController: trashCanController)
    }
}

extension JobsFlowController: TrashCanBackButtonDelegate {
    func didTapBackTrash() {
        remove(childController: trashCanController)
        add(childController: jobsViewController)
    }
}
