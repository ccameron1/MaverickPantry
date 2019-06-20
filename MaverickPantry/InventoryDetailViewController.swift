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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newAmountTextField.isHidden = true
    }
    
    
    @IBAction func whenUpdateAmountPressed(_ sender: UIButton) {
        newAmountTextField.isHidden = !newAmountTextField.isHidden
        
        
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
