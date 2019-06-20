//
//  LoginViewController.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

<<<<<<< HEAD
    let loginSegueIdentifier = "loginSuccessful"
=======
    let loginToAboutSegueIdentifier = "loginGood"
>>>>>>> e0e85ca4075247555a454743404e25feb389fd07
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
        FirebaseManager.Login(email: emailTextField.text!, password: passwordTextField.text!) { (success) in
            if success {
                print("yay")
<<<<<<< HEAD
                self.performSegue(withIdentifier: self.loginSegueIdentifier, sender: nil)
=======
                self.performSegue(withIdentifier: self.loginToAboutSegueIdentifier, sender: nil)
>>>>>>> e0e85ca4075247555a454743404e25feb389fd07
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
