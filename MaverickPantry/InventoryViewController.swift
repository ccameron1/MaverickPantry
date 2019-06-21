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
    
    var foods = [[String : Any]]()
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let applesauceDict = ["Food": "Applesauce", "amountLeft": 10, "amountGiven": 50] as [String : Any]
        let pizzaDict = ["Food": "Pizza", "amountLeft": 43, "amountGiven": 98] as [String : Any]
        let kaleDict = ["Food": "Kale", "amountLeft": 7, "amountGiven": 3] as [String : Any]
        
        foods = [applesauceDict,pizzaDict,kaleDict]
        
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
        cell.textLabel?.text = "\(food["Food"]!)"
        cell.detailTextLabel?.text = "Left: \(food["amountLeft"]!)\nGiven Out: \(food["amountGiven"]!)"
        return cell
    }
    
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let food = foods[indexPath.row]
        let dvc = segue.destination as! InventoryDetailViewController
        dvc.food = food
    }
    
    
    

}
