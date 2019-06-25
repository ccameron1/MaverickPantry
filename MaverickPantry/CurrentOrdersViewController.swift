//
//  CurrentOrdersViewController.swift
//  MaverickPantry
//
//  Created by Justine Linscott on 6/20/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class CurrentOrdersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // var currentOrder : [] = []
    var fakeOrder = [""]
    var selectedOrder : Order?
    var index: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Current Orders"
        
        
        
        //        noOrderLabel.text = "No Orders"
        //        noOrderLabel.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCount { (count, success) in
            if success {
                self.tableView.reloadData()
            }
        }
        tableView.reloadData()
        
    }
    func getCount(completion: @escaping (Int, Bool) -> Void) {
        var count: Int = 0
        FirebaseManager.getOrders { (orders, err) in
            if err == nil {
                FirebaseManager.globalOrders = orders
                count = orders.count
                completion(count, true)
            } else {
                completion(count, false)
            }
        }
    }
    
    // tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return currentOrder.count
        
        return FirebaseManager.globalOrders!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        cell?.textLabel!.text = FirebaseManager.globalOrders![indexPath.row].initials.uppercased()
        let yearOfBirthString = String(FirebaseManager.globalOrders![indexPath.row].yearOfBirth)
        cell?.detailTextLabel!.text = yearOfBirthString
        //        if currentOrder.count == 0 {
        //              title = "No Current Orders"
        //        } else {
        //        let birthDate = currentOrder[IndexPath.row].birthDate
        //        let initials = currentOrder[IndexPath.row].initals
        //        cell?.textLabel.text = birthDate
        //        cell?.detailTextLabel.text = initials
        
        //        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderDetailsSegue" {
            let orderDetailsVC = segue.destination as! CurrentOrderRequestViewController
            index = tableView.indexPathForSelectedRow?.row
            selectedOrder = FirebaseManager.globalOrders![index!]
            orderDetailsVC.selectedOrder = selectedOrder
            orderDetailsVC.index = index
        }
        
    }
 
    
}
