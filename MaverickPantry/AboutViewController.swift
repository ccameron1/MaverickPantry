//
//  AboutViewController.swift
//  MaverickPantry
//
//  Created by Patrick Stacey-Vargus on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var loggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

<<<<<<< HEAD
        // Do any additional setup after loading the view.
        let request1 = ["hi", "bye"]
        let request2 = ["cheese", "fruit"]
        FirebaseManager.globalUser.setRequests(request1: request1, request2: request2)
=======
//        if loggedIn == false {
//
//            performSegue(withIdentifier: "loginToAbout", sender: nil)
//            loggedIn = true
//        }
//        // Do any additional setup after loading the view.
>>>>>>> 5915d66d1d9b765449d8d3fed5952cbb800006d9
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
