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
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    var updateBool = false
    var amountLeft = 0
    var amountGiven = 0
    var foodName = ""
    
    var food : DummyFood!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newAmountTextField.isHidden = true
        self.title = food.name
        amountLeftLabel.text = "\(food.amountLeft!)"
        givenOutLabel.text = "\(food.amountGiven!)"
        
        imageView1.layer.borderWidth = 5
        imageView2.layer.borderWidth = 5
    }
    
    
    
    @IBAction func whenUpdateAmountPressed(_ sender: UIButton) {
        // when hitting update
        if !updateBool{
            newAmountTextField.isHidden = !newAmountTextField.isHidden
            updateButton.setTitle("Done", for: .normal)
            updateBool = !updateBool
        }
            //when hitting done
        else{
            let newAmount = Int(newAmountTextField.text!)
            if newAmount == nil || newAmount! < 0{
                let alertController = UIAlertController(title: "Invalid Amount", message: "Please enter a valid amount", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            } else{
                //                amountLeftLabel.text = "\(newAmount!)"
                food.setAmountLeft(amountLeft: newAmount!)
                FirebaseManager.databaseRef.collection("Inventory").document(food.name).setData(["currentAmount" : food.amountLeft!, "name": food.name!, "amountGivenAway" : food.amountGiven!])
                updateBool = !updateBool
                newAmountTextField.text = ""
                newAmountTextField.isHidden = true
                updateButton.setTitle("Update", for: .normal)
                amountLeftLabel.text = "\(food.amountLeft!)"
                
            }
            
        }
        
    }
    
    @IBAction func whenClearButtonPressed(_ sender: UIButton) {
        food.setAmountGiven(amountGiven: 0)
        FirebaseManager.databaseRef.collection("Inventory").document(food.name).setData(["currentAmount" : food.amountLeft!, "name": food.name!, "amountGivenAway" : 0])
        print ("Firebase Updated")
        givenOutLabel.text = "\(food.amountGiven!)"
        //        givenOutLabel.text = "0"
    }
    
}
