//
//  MosquittoServerController.swift
//  Chute-ios
//
//  Created by Thayallan Srinathan on 2018-11-03.
//  Copyright © 2018 Chute. All rights reserved.
//

/* MQTT Details
 Hostname: 192.168.9.201
 COMMANDS AND REQUESTS:
 
 TO OPEN LID:
 Send a message "ON" to the topic "chute-p"
 TO CLOSE LID:
 Send a message "OFF" to the topic "chute-p"
 TO REVERT TO AUTO MODE:
 Send a message "AUTO" to the topic "chute-p"
 FULLNESS THREAD:
 Listen in on the topic "chute". Messages are formatted in the following format:
 Fullness is rounded down to nearest full value. 17% Full = 0% Full.
 "F0" - 0% Full
 "F25" - 25% Full
 "F50" - 50% Full
 "F75" - 75% Full
 "F100" - 100% Full
 */

import UIKit
import Foundation
import Moscapsule

class MosquittoServerController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let mqttConfig = MQTTConfig(clientId: "salopan", host: "192.168.9.201", port: 1883, keepAlive: 600)
        mqttConfig.mqttAuthOpts = MQTTAuthOpts(username: "", password: "")
        mqttConfig.cleanSession = true
        
        let mqttClient = MQTT.newConnection(mqttConfig)
        mqttConfig.onMessageCallback = { mqttMessage in
            NSLog("MQTT Message received: payload=\(mqttMessage.payloadString)")
        }
        print("fuck salopan")
        print("\(mqttClient.isConnected)")
        //mqttClient.subscribe("chute", qos: 2)
        
        
        
        let deadline = DispatchTime.now() + 3.0
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            mqttClient.publish(string: "OPEN", topic: "chute-p", qos: 0, retain: false)
            print("\(mqttClient.isConnected)")
            mqttClient.disconnect()
        })
        
    }
}

