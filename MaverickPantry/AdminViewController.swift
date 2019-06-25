//
//  AdminViewController.swift
//  MaverickPantry
//
//  Created by Justine Linscott on 6/20/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var inventoryButton: UIButton!
    @IBOutlet weak var pushNotifButton: UIButton!
    @IBOutlet weak var foodEventButton: UIButton!
    @IBOutlet weak var currentOrdersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Admin Options"
        inventoryButton.addShadow()
        pushNotifButton.addShadow()
        //foodEventButton.addShadow()
        currentOrdersButton.addShadow()
        
    }
    



}
