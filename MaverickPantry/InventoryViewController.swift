//
//  InventoryViewController.swift
//  MaverickPantry
//
//  Created by Gwyneth Semanisin on 6/20/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var foods : [DummyFood] = []
        
  
    override func viewDidLoad() {
        super.viewDidLoad()
        


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCount { (count, success) in
            if success {
                self.tableView.reloadData()
            }
        }
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirebaseManager.globalInventory!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! UITableViewCell
        let food = FirebaseManager.globalInventory![indexPath.row]
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = "Left: \(food.amountLeft!)\nGiven Out: \(food.amountGiven!)"
        return cell
    }
    
    
    func getCount(completion: @escaping (Int, Bool) -> Void) {
        var count: Int = 0
        FirebaseManager.getInventory { (foods, err) in
            if err == nil {
                FirebaseManager.globalInventory = foods
                count = foods.count
                completion(count, true)
            } else {
                completion(count, false)
            }
        }
    }
    
    
    @IBAction func onAddButtonPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add New Food Item", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Food Name"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Current Amount"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Amount Given Out"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            let thirdTextField = alertController.textFields![2] as UITextField
            
            let name = firstTextField.text!
            let amountLeft = Int(secondTextField.text!)
            let amountGiven = Int(thirdTextField.text!)
            let itemToAdd = DummyFood(name: name, amountLeft: amountLeft!, amountGiven: amountGiven!)
            FirebaseManager.addInventoryItem(item: itemToAdd, completion: { (success) in
                if success {
                    print ("SUCCESS")
                    DispatchQueue.main.async {
                        self.viewWillAppear(true)
                    }
                }
            })
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let food = FirebaseManager.globalInventory![indexPath.row]
        let dvc = segue.destination as! InventoryDetailViewController
        dvc.food = food
    }
    
    
    

}
