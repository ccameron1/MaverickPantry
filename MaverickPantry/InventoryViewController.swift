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
 
    
    var amountLeft = 0
    var amountGiven = 0
    var foodName = "Applesauce"
    
    var foods : [DummyFood] = []
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let applesauce = DummyFood(name: "Applesauce", amountLeft: 42, amountGiven: 75)
        let pizza = DummyFood(name: "Pizza", amountLeft: 87, amountGiven: 23)
        let kale = DummyFood(name: "Kale", amountLeft: 100, amountGiven: 0)
//        let applesauceDict = ["Food": "Applesauce", "amountLeft": 10, "amountGiven": 50] as [String : Any]
//        let pizzaDict = ["Food": "Pizza", "amountLeft": 43, "amountGiven": 98] as [String : Any]
//        let kaleDict = ["Food": "Kale", "amountLeft": 7, "amountGiven": 3] as [String : Any]
//
        foods = [applesauce,pizza,kale]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! UITableViewCell
        let food = foods[indexPath.row]
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = "Left: \(food.amountLeft!)\nGiven Out: \(food.amountGiven!)"
        return cell
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
            self.foods.append(DummyFood(name: name, amountLeft: amountLeft!, amountGiven: amountGiven!))
            self.tableView.reloadData()
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
        let food = foods[indexPath.row]
        let dvc = segue.destination as! InventoryDetailViewController
        dvc.food = food
    }
    
    
    

}
