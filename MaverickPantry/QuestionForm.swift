//
//  QuestionForm.swift
//  MaverickPantry
//
//  Created by Grayson Stanton on 11/27/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation

class QuestionForm {
    var NUID: String?
    var firstInitial : String?
    var middleInitial : String?
    var lastInitial : String?
    var birthDate : Int?
    var allergies :String?
    var comments : String?
    var affiliation : String?
    var onOrOffCampus : String?
    var householdSize : String?
    var methodOfHearing : String?
    var canOpenerBool = false
    var bagBool = false
    
    
    init(NUID: String?, firstInitial: String, middleInitial: String, lastInitial: String, birthDate: Int, allergies: String, comments: String, affiliation: String, onOrOffCampus: String, householdSize: String, methodOfHearing: String, canOpenerBool: Bool, bagBool: Bool) {
        
        self.NUID = NUID
        self.firstInitial = firstInitial
        self.middleInitial = middleInitial
        self.lastInitial = lastInitial
        self.birthDate = birthDate
        self.allergies = allergies
        self.comments = comments
        self.affiliation = affiliation
        self.onOrOffCampus = onOrOffCampus
        self.householdSize = householdSize
        self.methodOfHearing = methodOfHearing
        self.canOpenerBool = canOpenerBool
        self.bagBool = bagBool
    }
}
