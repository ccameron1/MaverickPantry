//
//  AboutViewController.swift
//  MaverickPantry
//
//  Created by Patrick Stacey-Vargus on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit
import SafariServices

class AboutViewController: UIViewController, SFSafariViewControllerDelegate {
    
    let linkCAPS = "https://www.unomaha.edu/student-life/wellness/counseling-and-psychological-services/index.php"
    let linkWellness = "https://www.unomaha.edu/student-life/wellness/index.php"
    let linkTutoring = "https://www.unomaha.edu/student-life/inclusion/military-and-veteran-services/student-support-services/student-success.php"
    let linkCareer = "https://www.unomaha.edu/student-life/achievement/academic-and-career-development-center/career-development/index.php"
    
    let moneyDonations = "https://nufoundation.org/search?fundSearch=true&q=01130780"
    
    let foodDonations = "https://www.unomaha.edu/student-life/_img/civic-and-social/mfp-item-list.pdf"

    @IBOutlet weak var loginButton: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var adminBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // makes admin clear until login
        adminBarButton.isEnabled = false
        adminBarButton.tintColor = UIColor.clear
        
        if FirebaseManager.currentUserId.count > 0 {
            self.tabBarController?.tabBar.isHidden = false
        } else {
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    
    @IBAction func unwindToAbout(segue:UIStoryboardSegue) {
        if FirebaseManager.currentUserId.count > 0 {
            self.tabBarController?.tabBar.isHidden = false
            
            //changes buttons
            adminBarButton.isEnabled = true
            adminBarButton.tintColor = UIColor.red
            //red: 215, green: 25, blue: 32, alpha: 1.0
            loginButton.isEnabled = false
        }
            
        else {
            self.tabBarController?.tabBar.isHidden = true

        }
    }
    
    
    @IBAction func onCAPSButtonPressed(_ sender: UIButton) {
        if let link = URL(string: linkCAPS) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            //sfvc.preferredBarTintColor = .black
            
            present(sfvc, animated: true)
            
        }
    }
    

    @IBAction func onWellnessCenterButtonPressed(_ sender: UIButton) {
        if let link = URL(string: linkWellness) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            //sfvc.preferredBarTintColor = .black
            
            present(sfvc, animated: true)
            
        }
        print("wellness")
    }
    
    @IBAction func onTutoringCenterPressed(_ sender: UIButton) {
        if let link = URL(string: linkTutoring) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            //sfvc.preferredBarTintColor = .black
            
            present(sfvc, animated: true)
            
        }
        print("tutoring")
    }
    
    @IBAction func onCareerServicesPressed(_ sender: UIButton) {
        if let link = URL(string: linkCareer) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            //sfvc.preferredBarTintColor = .black
            
            present(sfvc, animated: true)
            
        }
        print("Career")
    }
    
    @IBAction func onDonateMoneyPressed(_ sender: UIButton) {
        if let link = URL(string: moneyDonations) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            //sfvc.preferredBarTintColor = .black
            
            present(sfvc, animated: true)
            
        }
    }
    
    @IBAction func onDonateFoodPressed(_ sender: UIButton) {
        if let link = URL(string: foodDonations) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            //sfvc.preferredBarTintColor = .black
            
            present(sfvc, animated: true)
            
        }
    }
    
    
    
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
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
