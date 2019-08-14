//
//  ResourceItem.swift
//  MaverickPantry
//
//  Created by Keegan Brown on 8/8/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation
import UIKit

class ResourceItem{
    
    var name : String?
    var desc : String?
    var image : UIImage?
    var link : String?
    var phoneNumber : String
    var address : String
    
    init(name : String, desc : String, image : UIImage, link : String, phoneNumber: String, address: String) {
        self.name = name
        self.desc = desc
        self.image = image
        self.link = link
        self.phoneNumber = phoneNumber
        self.address = address
    }
    
}
