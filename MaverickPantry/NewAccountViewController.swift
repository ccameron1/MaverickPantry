//
//  NewAccountViewController.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class NewAccountViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var yearOfBirthTextField: UITextField!
    @IBOutlet weak var initialsTextField: UITextField!
    @IBOutlet weak var NUIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let request1 = ["chicken", "cookiessssss", "salad", "pizza"]
//        FirebaseManager.globalUser.request1 = []
        FirebaseManager.addRequestsToUser(requests: request1)
        
        
        backgroundImage.addShadow()
    }
    
    @IBAction func createAccountButton(_ sender: Any) {
        FirebaseManager.CreateAccount(email: emailTextField.text!, password: passwordTextField.text!, initials: initialsTextField.text!, yearOfBirth: Int(yearOfBirthTextField.text!)!, isAdmin: false, NUID : NUIDTextField.text!) { (success) in
            if success {
                print("new acount homies")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
