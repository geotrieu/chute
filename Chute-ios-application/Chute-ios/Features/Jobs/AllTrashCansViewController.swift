//
//  AllTrashCansViewController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-04.
//  Copyright © 2018 Chute. All rights reserved.
//

import UIKit
import EasyPeasy
import Then
import Foundation
import Moscapsule

struct myVariables {
    static var level = "F0"
}

class AllTrashCansViewController: UIViewController {

    private let headerView = HomeHeaderView()
    
    let backButtonView = TrashCanBackButtonView()
    
    
    private let trashCansLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.demiBold(30)
        $0.text = "Trash Cans"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mqttConfig = MQTTConfig(clientId: "salopan", host: "192.168.9.201", port: 1883, keepAlive: 600)
        mqttConfig.mqttAuthOpts = MQTTAuthOpts(username: "", password: "")
        mqttConfig.cleanSession = true
        mqttConfig.onMessageCallback = { mqttMessage in
            //NSLog("MQTT Message received: payload=\(mqttMessage.payloadString?.first)")
            print("\(mqttMessage.payloadString!)")
            myVariables.level = mqttMessage.payloadString!
            let trashcanView = AvailableTrashCanView(level: myVariables.level)
            self.view.addSubview(trashcanView)
            trashcanView.easy.layout(Top(20).to(self.trashCansLabel), Width(300),Height(200), CenterX())
        }
        
        let mqttClient = MQTT.newConnection(mqttConfig)
        
        print("fuck salopan")
        print("\(mqttClient.isConnected)")
        
        mqttClient.subscribe("chute", qos: 2)
        
        //lol
        let deadline = DispatchTime.now() + 30000.0
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
           // mqttClient.publish(string: "AUTO", topic: "chute-p", qos: 0, retain: true)
           print("\(mqttClient.isConnected)")
            
        })
        layoutViews()
    }
}

extension AllTrashCansViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Top(), Width(375), Height(100))
    
        view.addSubview(trashCansLabel)
        trashCansLabel.easy.layout(Top(5).to(headerView), Left(10))
    
        view.addSubview(backButtonView)
        backButtonView.easy.layout(Top(50), Left(15), Width(30), Height(20))
    }
}




