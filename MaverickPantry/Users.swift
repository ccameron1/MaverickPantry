//
//  Users.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class Users {
    
    var isAdmin: Bool
    var email: String
    var initials: String
    var yearOfBirth: Int
    var NUID : String
    var uid : String
    var request1 : [String]
    var request2 : [String]
    var timestamp1: NSDate
    var timestamp2: NSDate
    
    
    init(isAdmin: Bool, email: String, initials: String, yearOfBirth: Int, NUID: String, uid : String, request1: [String], request2: [String], timestamp1: NSDate, timestamp2: NSDate) {
        self.isAdmin = isAdmin
        self.email = email
        self.initials = initials
        self.yearOfBirth = yearOfBirth
        self.NUID = NUID
        self.uid = uid
        self.request1 = request1
        self.request2 = request2
        self.timestamp1 = timestamp1
        self.timestamp2 = timestamp2
    }
    
    
    func setRequests(request1: [String], request2: [String]) {
        FirebaseManager.globalUser.request1 = request1
        FirebaseManager.globalUser.request2 = request2

        
        let db = Firestore.firestore()
        db.collection("Users").document("\(FirebaseManager.globalUser.uid)").setData([ "request1": request1 ], merge: true)
        
    }
    
    
}
