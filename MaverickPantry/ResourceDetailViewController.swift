//
//  ResourceDetailViewController.swift
//  MaverickPantry
//
//  Created by Keegan Brown on 9/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class ResourceDetailViewController: UIViewController {
    
    var selectedResource : ResourceItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(selectedResource!.name)

    }
    

}
