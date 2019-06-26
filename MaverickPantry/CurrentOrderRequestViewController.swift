//
//  CurrentOrderRequestViewController.swift
//  MaverickPantry
//
//  Created by Justine Linscott on 6/20/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class CurrentOrderRequestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedOrder : Order?
    var index: Int?
    
    var foodGroup : [String] = ["Protein", "Vegetables", "Fruits", "Grain", "Additional Food Products", "Miscellaneous Products", "Personal Hygiene Products"]
    
    //var items : [] = []
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Request Form"
        let initials = (selectedOrder!.initials)!.uppercased()
        
        nameLabel.text = "Order For: \(initials)"

    }

//tableView Functions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let requests = selectedOrder!.requests as! [String]
        let count = requests.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RcellID")
//        let foodType = foodGroup[indexPath.row]
        cell?.textLabel!.text = selectedOrder?.requests![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    @IBAction func fillOrderButton(_ sender: UIButton) {
        
        FirebaseManager.getInventory(completion: { (inventory, error) in
            if error == nil {
                for request in self.selectedOrder!.requests!{
                    for item in inventory{
                        if request == item.name{
                            item.amountGiven = item.amountGiven + 1
                            item.amountLeft = item.amountLeft - 1
                            FirebaseManager.databaseRef.collection("Inventory").document(item.name).setData(["name" : item.name!, "amountGivenAway" : item.amountGiven!, "currentAmount" : item.amountLeft!])
                        }
                    }
                }
            }
        })
        
        FirebaseManager.globalOrders?.remove(at: index!)
        
        //clear from firebase
        
        FirebaseManager.databaseRef.collection("Orders").document("Order: \(selectedOrder!.initials!) \(selectedOrder!.yearOfBirth!) \(selectedOrder!.timestamp!)").setData(["requests": selectedOrder!.requests!, "initials": selectedOrder!.initials!, "isReady": true, "yearOfBirth": selectedOrder!.yearOfBirth!, "timestamp": selectedOrder!.timestamp])
        
    }
    
    
}
