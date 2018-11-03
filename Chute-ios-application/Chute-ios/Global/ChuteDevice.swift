//
//  ChuteDevice.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import DeviceKit

struct ChuteDevice {
    
    let device = Device()
    
    func isiPhoneX() -> Bool {
        return device.isOneOf([.iPhoneX, .simulator(.iPhoneX)])
    }
}
