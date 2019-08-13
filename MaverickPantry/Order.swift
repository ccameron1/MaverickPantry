//
//  Order.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/24/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation

class Order {
    var requests: [String]?
    var initials: String?
    var timestamp : Double?
    var isReady: Bool?
    var monthOfBirth: Int?
    var dayOfBirth: Int?
    
    init(requests: [String], intitials: String, timestamp: Double, isReady: Bool, monthOfBirth: Int, dayOfBirth: Int) {
        self.requests = requests
        self.initials = intitials
        self.timestamp = timestamp
        self.isReady = isReady
        self.dayOfBirth = dayOfBirth
        self.monthOfBirth = monthOfBirth
    }
}
