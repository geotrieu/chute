//
//  SplashViewController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import Lottie
import EasyPeasy

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        
        let imageView = UIImageView(image: UIImage(named: "chuteLogo"))
        view.addSubview(imageView)
        imageView.easy.layout(CenterX(), Width(375), Height(450), Top(150))
        
        let animationView = LOTAnimationView(name: "splash-view-controller-animation")
        self.view.addSubview(animationView)
        print("\(animationView.animationDuration)")
        animationView.play()
    }
}

