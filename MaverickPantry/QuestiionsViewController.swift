//
//  QuestiionsViewController.swift
//  MaverickPantry
//
//  Created by Grayson Stanton on 8/9/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit
import iOSDropDown
import Firebase
import FirebaseFirestore
class QuestiionsViewController: UIViewController{
    
    

    
    @IBOutlet weak var bagDrop: DropDown!
    @IBOutlet weak var methodOfHearingDrop: DropDown!
    @IBOutlet weak var householdSizeDrop: DropDown!
    @IBOutlet weak var campusDrop: DropDown!
    @IBOutlet weak var canOpenerDrop: DropDown!
    @IBOutlet weak var affiliationDrop: DropDown!
    @IBOutlet weak var allergiesTextField: UITextField!
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var firstInitialTextField: UITextField!
    @IBOutlet weak var middleInitialTextField: UITextField!
    @IBOutlet weak var lastInitialTextField: UITextField!
//
    var firstInitial = ""
    var middleInitial = ""
    var lastInitial = ""
    var birthDate = 0
    var allergies = ""
    var comments = ""
    var NUID : String?
    override func viewWillAppear(_ animated: Bool) {
        canOpenerDrop.optionArray = ["Yes", "No"]
        affiliationDrop.optionArray = ["Currently Enrolled Student", "Currently Employed Faculty", "Currently Employed Staff", "Other (Please Specify in Additional Comments Section)"]
        campusDrop.optionArray = ["On Campus", "Off Campus", "Other"]
        householdSizeDrop.optionArray = ["Self", "Self and one dependent", "Self and two dependents", "Self and three dependents", "Self and 4+ dependents", "Other"]
        methodOfHearingDrop.optionArray = ["Class Syllabus", "Saw the pantry in the CEC", "From UNO Faculty or Staff", "From a friend", "From a Housing Professional or other housing resource", "A Maverick Food Pantry Flier", "I have used Maverick Food Pantry in the past", "Social Media", "Tabling Event", "Other"]
        canOpenerDrop.optionArray = ["Yes", "No"]
        bagDrop.optionArray = ["Yes", "No"]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
    @IBAction func onContinuePressed(_ sender: Any) {
        if (firstInitialTextField.text == "" || lastInitialTextField.text == "" || affiliationDrop.selectedIndex == nil || canOpenerDrop.selectedIndex == nil || bagDrop.selectedIndex == nil)
        {
            let alertController = UIAlertController.init(title: "Incomplete Fields", message: "Please enter all of the required fields before continuing.", preferredStyle: .alert)
            let alertAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: false)
        }
        else
        {
            firstInitial = firstInitialTextField.text!
            middleInitial = middleInitialTextField.text!
            lastInitial = lastInitialTextField.text!
            allergies = allergiesTextField.text!
            comments = commentsTextField.text!
            var affiliation = affiliationDrop.optionArray.remove(at: affiliationDrop.selectedIndex ?? 0)
            var onOrOffCampus = campusDrop.optionArray.remove(at: campusDrop.selectedIndex ?? 0)
            var householdSize = householdSizeDrop.optionArray.remove(at: householdSizeDrop.selectedIndex ?? 0)
            var methodOfHearing = methodOfHearingDrop.optionArray.remove(at: methodOfHearingDrop.selectedIndex ?? 0)
            var canOpenerBool = false
            var bagBool = false
            if (canOpenerDrop.optionArray.remove(at: canOpenerDrop.selectedIndex!) == "Yes")
            {
               canOpenerBool = true
            }
            if (bagDrop.optionArray.remove(at: bagDrop.selectedIndex!) == "Yes")
            {
                bagBool = true
            }
            
            NUID = FirebaseManager.globalUser.NUID
            FirebaseManager.addQuestionForm(item: QuestionForm.init(NUID: NUID, firstInitial: firstInitial, middleInitial: middleInitial, lastInitial: lastInitial, birthDate: birthDate, allergies: allergies, comments: comments, affiliation: affiliation, onOrOffCampus: onOrOffCampus, householdSize: householdSize, methodOfHearing: methodOfHearing, canOpenerBool: canOpenerBool, bagBool: bagBool)) { (success) in
                if success
                {
                    self.performSegue(withIdentifier: "continueSegue", sender: nil)
                }
                else
                {
                    print("Error")
                }
            }

        }
        
    }
 
}
