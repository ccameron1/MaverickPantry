//
//  ViewController.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        FirebaseManager.Login(email: "hello@unomaha.edu", password: "password") { (success) in
        //            if success {
        //                print("success")
        //            }
        //        }
        
        FirebaseManager.CreateAccount(email: "hello@unopaha.edu", password: "password", initials: "CMC", yearOfBirth: 2000, isAdmin: false) { (success) in
            if success {
                print("success")
            }
        }
    }
    
    
}

