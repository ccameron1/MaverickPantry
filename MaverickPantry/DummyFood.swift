//
//  DummyFood.swift
//  MaverickPantry
//
//  Created by Gwyneth Semanisin on 6/21/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation

class DummyFood{
    
    var name : String!
    var amountLeft : Int!
    var amountGiven : Int!
    
    init(name : String, amountLeft : Int, amountGiven : Int) {
        self.name = name
        self.amountLeft = amountLeft
        self.amountGiven = amountGiven
    }
    
    func setName(name : String){
        self.name = name
    }
    
    func setAmountLeft(amountLeft : Int){
        self.amountLeft = amountLeft
    }
    
    func setAmountGiven(amountGiven : Int){
        self.amountGiven = amountGiven
    }
}
