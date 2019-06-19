//
//  Users.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation

class Users {
    
    var isAdmin: Bool
    var email: String
    var initials: String
    var yearOfBirth: Int
    
    init(isAdmin: Bool, email: String, initials: String, yearOfBirth: Int) {
        self.isAdmin = isAdmin
        self.email = email
        self.initials = initials
        self.yearOfBirth = yearOfBirth
    }
}
