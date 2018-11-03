//
//  HomeCompletedJobsCardViewModel.swift
//  Chute-ios
//
//  Created by Salopan Vimalaruban on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

class HomeCompletedJobsCardViewModel {
    var imageName: String = ""
    var numOfCompletedJobs: String = ""
    
    init(imageName: String, numOfCompletedJobs: String) {
        self.imageName = imageName
        self.numOfCompletedJobs = numOfCompletedJobs
}
}
