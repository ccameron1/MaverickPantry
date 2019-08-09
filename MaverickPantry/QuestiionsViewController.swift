//
//  QuestiionsViewController.swift
//  MaverickPantry
//
//  Created by Grayson Stanton on 8/9/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class QuestiionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    

    @IBOutlet weak var monthPV: UIPickerView!
    @IBOutlet weak var affiliationPV: UIPickerView!
    @IBOutlet weak var methodOfHearingPV: UIPickerView!
    @IBOutlet weak var allergiesTextField: UITextField!
    
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var firstInitialTextField: UITextField!
    @IBOutlet weak var middleInitialTextField: UITextField!
    @IBOutlet weak var lastInitialTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    
    var firstInitial = ""
    var middleInitial = ""
    var lastInitial = ""
    var birthDate = 0
    var allergies = ""
    var comments = ""
    var affiliations = ["aff1", "aff2"]
    var methodsOfHearing = ["method1", "method2"]
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var month = ""
    var affiliation = ""
    var methodOfHearing = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        monthPV.delegate = self
        monthPV.dataSource = self
        affiliationPV.delegate = self
        affiliationPV.dataSource = self
        methodOfHearingPV.delegate = self
        methodOfHearingPV.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onContinuePressed(_ sender: Any) {
        if firstInitialTextField.text == ""
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
            birthDate = Int(birthDateTextField.text!)!
            allergies = allergiesTextField.text!
            comments = commentsTextField.text!
            
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == monthPV
        {
            return 12
        }
        else if pickerView == affiliationPV
        {
            return affiliations.count
        }
        else
        {
            return methodsOfHearing.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == monthPV
        {
            return months[row]
        }
        else if pickerView == affiliationPV
        {
            return affiliations[row]
        }
        else
        {
            return methodsOfHearing[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == monthPV
        {
            month = months[row]
        }
        else if pickerView == affiliationPV
        {
            affiliation = affiliations[row]
        }
        else
        {
            methodOfHearing = methodsOfHearing[row]
        }
    }
}
