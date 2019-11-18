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
    
    @IBOutlet weak var capsButton: UIButton!
    @IBOutlet weak var wellnessButton: UIButton!
    @IBOutlet weak var tutoringButton: UIButton!
    @IBOutlet weak var careerButton: UIButton!
    
    
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
        
        
        
        textView.text = "      Food insecurity is becoming more evident on college campuses, and UNO is no exception. A growing concern about food insecurity among our fellow Mavs has prompted action.\n      UNO’s Maverick Food Pantry aims to contribute to UNO’s culture of caring by providing resources to those in immediate need and connecting them with additional resources in the greater Omaha area for long-term support.\n      We are dedicated to eliminating hunger in the UNO community and increasing awareness of food insecurity and nutrition.\n      The Maverick Food Pantry offers food and personal hygiene products to UNO faculty, staff members, and currently-enrolled students by providing healthy, organic, and culturally sensitive items. Requests for food packages can be submitted through an easy online form or this app twice a week."
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        adminBarButton.isEnabled = false
        adminBarButton.tintColor = UIColor.clear
        
       
        
        
        if FirebaseManager.currentUserId.count > 0 {
            self.tabBarController?.tabBar.isHidden = false
            if FirebaseManager.globalUser.isAdmin {
                adminBarButton.isEnabled = true
                adminBarButton.tintColor = UIColor.red
            }
        } else {
            loginButton.isEnabled = true
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    
    @IBAction func unwindToAbout(segue:UIStoryboardSegue) {
        if FirebaseManager.currentUserId.count > 0 {
            self.tabBarController?.tabBar.isHidden = false
            
            //changes buttons
            if FirebaseManager.globalUser.isAdmin {
                adminBarButton.isEnabled = true
                adminBarButton.tintColor = UIColor.red
            }
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
            
            present(sfvc, animated: true)
            
        }
    }
    
    
    @IBAction func onWellnessCenterButtonPressed(_ sender: UIButton) {
        if let link = URL(string: linkWellness) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            
            present(sfvc, animated: true)
            
        }
        print("wellness")
    }
    
    @IBAction func onTutoringCenterPressed(_ sender: UIButton) {
        if let link = URL(string: "https://www.opendoormission.org/") {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            
            present(sfvc, animated: true)
            
        }
        print("tutoring")
    }
    
    @IBAction func onCareerServicesPressed(_ sender: UIButton) {
        if let link = URL(string: linkCareer) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            
            present(sfvc, animated: true)
            
        }
        print("Career")
    }
    
    @IBAction func onDonateMoneyPressed(_ sender: UIButton) {
        if let link = URL(string: moneyDonations) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            
            present(sfvc, animated: true)
            
        }
    }
    
    @IBAction func onDonateFoodPressed(_ sender: UIButton) {
        if let link = URL(string: foodDonations) {
            let sfvc = SFSafariViewController(url: link)
            sfvc.delegate = (self as! SFSafariViewControllerDelegate)
            sfvc.preferredControlTintColor = .red
            
            present(sfvc, animated: true)
            
        }
    }
    
    
    
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
    
    @IBAction func onTwitterPressed(_ sender: UIButton) {
        let Username =  "MavFoodPantry" // twitter username
        let appURL = URL(string: "twitter://user?screen_name=\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if twitter app is not installed, open URL inside Safari
            if let link = URL(string: "https://twitter.com/\(Username)") {
                let sfvc = SFSafariViewController(url: link)
                sfvc.delegate = (self as! SFSafariViewControllerDelegate)
                sfvc.preferredControlTintColor = .red
                
                present(sfvc, animated: true)
                
            }
        }
    }
    
    @IBAction func onFacebookPressed(_ sender: UIButton) {
        let Username =  "unomavfoodpantry" // Instagram Username
        let appURL = URL(string: "fb://profile/\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            if let link = URL(string: "https://www.facebook.com/\(Username)/") {
                let sfvc = SFSafariViewController(url: link)
                sfvc.delegate = (self as! SFSafariViewControllerDelegate)
                sfvc.preferredControlTintColor = .red
                
                present(sfvc, animated: true)
                
            }
        }
    }
    
    @IBAction func onInstaPressed(_ sender: UIButton) {
        let Username =  "unomaverickfoodpantry" // Instagram Username
        let appURL = URL(string: "instagram://user?username=\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            if let link = URL(string: "https://instagram.com/\(Username)") {
                let sfvc = SFSafariViewController(url: link)
                sfvc.delegate = (self as! SFSafariViewControllerDelegate)
                sfvc.preferredControlTintColor = .red
                
                present(sfvc, animated: true)
                
            }
        }
    }
    
    
    
    @IBAction func unwindFromNotLoggedIn(segue:UIStoryboardSegue) {
        
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
