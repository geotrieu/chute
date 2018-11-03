//
//  HomeNewsCardViewModel.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//


class HomeNewsCardViewModel {
    var titleLabel: String = ""
    var description: String = ""
    var imageName: String = ""
    
    init(titleLabel: String, description: String, imageName: String) {
        self.titleLabel = titleLabel
        self.description = description
        self.imageName = imageName
    }
}

