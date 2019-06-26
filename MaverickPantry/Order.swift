//
//  Order.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/24/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation

class Order {
    var requests: [String]!
    var initials: String!
    var yearOfBirth: Int!
    var timestamp : Double!
    var isPickedUp: Bool!
    
    init(requests: [String], intitials: String, yearOfBirth: Int, timestamp: Double, isPickedUp: Bool) {
        self.requests = requests
        self.initials = intitials
        self.yearOfBirth = yearOfBirth
        self.timestamp = timestamp
        self.isPickedUp = isPickedUp
    }
}
