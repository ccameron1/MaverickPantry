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
    
    @IBOutlet weak var imageTest2: UIImageView!
   
    @IBOutlet weak var imageTest4: UIImageView!
    @IBOutlet weak var imageTest: UIImageView!
    @IBOutlet weak var imageTest3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageTest.addShadow()
        imageTest2.addShadow()
        imageTest3.addShadow()
        imageTest4.addShadow()
        
        if FirebaseManager.currentUserId.count > 0 {
            self.tabBarController?.tabBar.isHidden = false
        }
            
        else {
            self.tabBarController?.tabBar.isHidden = true
        }
        // Do any additional setup after loading the view.
//        let request1 = ["hi", "bye"]
//        let request2 = ["cheese", "fruit"]
//        FirebaseManager.globalUser.setRequests(request1: request1, request2: request2)

//        if loggedIn == false {
//
//            performSegue(withIdentifier: "loginToAbout", sender: nil)
//            loggedIn = true
//        }
//        // Do any additional setup after loading the view.

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if FirebaseManager.currentUserId.count > 0 {
            self.tabBarController?.tabBar.isHidden = false
        }
            
        else {
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    
    @IBAction func unwindToAbout(segue:UIStoryboardSegue) {
        
        
        
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
