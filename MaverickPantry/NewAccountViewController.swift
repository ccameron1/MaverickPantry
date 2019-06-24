//
//  NewAccountViewController.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class NewAccountViewController: UIViewController {

    let loginToAboutSegueIdentifier = "unwindToAbout2"
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var yearOfBirthTextField: UITextField!
    @IBOutlet weak var initialsTextField: UITextField!
    @IBOutlet weak var NUIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let request1 = ["chicken", "cookief", "saladssssssss", "pizzazzzzzzz"]
////        FirebaseManager.globalUser.request1 = []
        
        
        
//
        self.tabBarController?.tabBar.isHidden = true
        backgroundImage.addShadow()
    }
    
    @IBAction func createAccountButton(_ sender: Any) {
        FirebaseManager.CreateAccount(email: emailTextField.text!, password: passwordTextField.text!, initials: initialsTextField.text!, yearOfBirth: Int(yearOfBirthTextField.text!)!, isAdmin: false, NUID : NUIDTextField.text!) { (success) in
            if success {
                print("new acount homies")
                self.performSegue(withIdentifier: self.loginToAboutSegueIdentifier, sender: nil)
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
