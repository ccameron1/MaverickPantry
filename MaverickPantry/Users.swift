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
    var NUID : String
    var uid : String
    var request1 : [String]
    var request2 : [String]
    
    
    init(isAdmin: Bool, email: String, initials: String, yearOfBirth: Int, NUID: String, uid : String) {
        self.isAdmin = isAdmin
        self.email = email
        self.initials = initials
        self.yearOfBirth = yearOfBirth
        self.NUID = NUID
        self.uid = uid
        request1 = ["", ""]
        request2 = ["", ""]
    }
    
}
