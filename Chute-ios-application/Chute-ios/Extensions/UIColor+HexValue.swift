//
//  UIColor+HexValue.swift
//  Scuto
//
//  Created by Thayallan Srinathan on 2018-10-09.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexValue: Int) {
        let components = (
            R: CGFloat((hexValue >> 16) & 0xFF) / 255,
            G: CGFloat((hexValue >> 08) & 0xFF) / 255,
            B: CGFloat((hexValue >> 00) & 0xFF) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1.0)
    }
}
