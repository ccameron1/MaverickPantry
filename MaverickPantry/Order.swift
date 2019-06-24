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
    
    init(requests: [String], intitials: String, yearOfBirth: Int) {
        self.requests = requests
        self.initials = intitials
        self.yearOfBirth = yearOfBirth
    }
}
