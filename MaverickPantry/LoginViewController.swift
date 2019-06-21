//
//  LoginViewController.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    let loginToAboutSegueIdentifier = "loginGood"

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImage.addShadow()
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
//        backgroundImage.addShadow()
        
//        backgroundImage.clipsToBounds = true
        
        FirebaseManager.Login(email: emailTextField.text!, password: passwordTextField.text!) { (success) in
            if success {
                print("yay")

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

extension UIView {
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 6
        clipsToBounds = false
    }
}
