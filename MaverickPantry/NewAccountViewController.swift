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
    
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var NUIDErrorLabel: UILabel!
    @IBOutlet weak var initialsErrorLabel: UILabel!
    @IBOutlet weak var yearErrorLabel: UILabel!
    
    
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
        clearErrors()
        if !checkForError() {
            
            FirebaseManager.CreateAccount(email: emailTextField.text!, password: passwordTextField.text!, initials: initialsTextField.text!, yearOfBirth: Int(yearOfBirthTextField.text!)!, isAdmin: false, NUID : NUIDTextField.text!) { (success) in
                if success {
                    print("new acount homies")
                    let alertController = UIAlertController(title: "Verify Email Address", message: "An email has been sent to you in order to verify your email address. You will not have access to requests until the account is verified.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                        self.performSegue(withIdentifier: self.loginToAboutSegueIdentifier, sender: nil)
                    })
                    alertController.addAction(action)
                    self.present(alertController, animated: true)
                    
                }
            }
        }
    }
    
    
    func checkForError() -> Bool {
        var ret = false
        if !(emailTextField.text?.contains("@unomaha.edu"))! {
            emailErrorLabel.isHidden = false
            ret = true
        }
        if (passwordTextField.text?.count)! < 6 {
            passwordErrorLabel.isHidden = false
            ret = true
        }
        if NUIDTextField.text!.count != 8 {
            NUIDErrorLabel.isHidden = false
            ret = true
        }
        if initialsTextField.text!.count < 2 {
            initialsErrorLabel.isHidden = false
            ret = true
        }
        if yearOfBirthTextField.text?.count != 4 {
            yearErrorLabel.isHidden = false
            ret = true
        }
        return ret
    }
    
    func clearErrors() {
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        NUIDErrorLabel.isHidden = true
        initialsErrorLabel.isHidden = true
        yearErrorLabel.isHidden = true
        
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
