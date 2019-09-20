//
//  ResourceDetailViewController.swift
//  MaverickPantry
//
//  Created by Keegan Brown on 9/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class ResourceDetailViewController: UIViewController {
    
    @IBOutlet weak var orgImageView: UIImageView!
    @IBOutlet weak var orgNameLabel: UILabel!
    @IBOutlet weak var orgDescTextField: UITextView!
    
    var selectedResource : ResourceItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        orgImageView.image = selectedResource!.image
        orgNameLabel.text = selectedResource!.name!
        let descString = selectedResource!.desc! + "\n\n" + selectedResource!.phoneNumber + "\n" + selectedResource!.address
        orgDescTextField.text = descString

    }
    
}
