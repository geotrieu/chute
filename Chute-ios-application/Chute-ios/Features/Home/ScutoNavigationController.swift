//
//  ScutoNavigationController.swift
//  Scuto
//
//  Created by Thayallan Srinathan on 2018-06-12.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class ScutoNavigationController: UINavigationController {
    
    // ENUMERATION - ScutoNavigationController Color Schemes
    enum ScutoNavigationControllerColorScheme {
        case white, black
    }
    
    var colorScheme: ScutoNavigationControllerColorScheme = .white {
        didSet {
            setColorScheme()
        }
    }
    
    init(rootViewController: UIViewController, colorScheme: ScutoNavigationControllerColorScheme = .white) {
        super.init(rootViewController: rootViewController)
        
        self.colorScheme = colorScheme
        
        setupNavigationControllerProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Override Variables and Functions
extension ScutoNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch colorScheme {
            case .white:
                return .default
            case .black:
                return .lightContent
            
        }
    }
}

// EXTENSION - ScutoNavigationController View Customization
extension ScutoNavigationController {
    
    func setupNavigationControllerProperties() {
        isNavigationBarHidden = true
        setColorScheme()
    }
    
    func setColorScheme() {
        view.backgroundColor = UIColor.white
    }
}
