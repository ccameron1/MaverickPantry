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
    
    init(name : String, desc : String, image : UIImage) {
        self.name = name
        self.desc = desc
        self.image = image
    }
    
}
