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
    
    
    init(isAdmin: Bool, email: String, initials: String, yearOfBirth: Int, NUID: String, uid : String, request1: [String], request2: [String]) {
        self.isAdmin = isAdmin
        self.email = email
        self.initials = initials
        self.yearOfBirth = yearOfBirth
        self.NUID = NUID
        self.uid = uid
        self.request1 = request1
        self.request2 = request2
    }
    
    
    func setRequests(request1: [String], request2: [String]) {
        FirebaseManager.globalUser.request1 = request1
        FirebaseManager.globalUser.request2 = request2

        
        let db = Firestore.firestore()
        db.collection("Users").document("\(FirebaseManager.globalUser.uid)").setData([ "request1": request1 ], merge: true)
        
    }
    
    
}
