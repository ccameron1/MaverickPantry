//
//  InventoryDetailViewController.swift
//  MaverickPantry
//
//  Created by Gwyneth Semanisin on 6/20/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class InventoryDetailViewController: UIViewController {

    @IBOutlet weak var amountLeftLabel: UILabel!
    @IBOutlet weak var newAmountTextField: UITextField!
    @IBOutlet weak var givenOutLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    var updateBool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newAmountTextField.isHidden = true
    }
    
    
    @IBAction func whenUpdateAmountPressed(_ sender: UIButton) {
        //when hitting done
        if updateBool{
            let newAmount = Int(newAmountTextField.text!)
            if newAmount == nil || newAmount! < 0{
                let alertController = UIAlertController(title: "Invalid Amount", message: "Please enter a valid amount", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            } else{
                amountLeftLabel.text = "\(newAmount!)"
                updateBool = !updateBool
                newAmountTextField.text = ""
                newAmountTextField.isHidden = true
                updateButton.setTitle("Update", for: .normal)
            }
        
        }
        // when hitting update
        if !updateBool{
            newAmountTextField.isHidden = !newAmountTextField.isHidden
            updateButton.setTitle("Done", for: .normal)
            updateBool = !updateBool
        }
        
    }
    
    @IBAction func whenClearButtonPressed(_ sender: UIButton) {
        givenOutLabel.text = "0"
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
