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
        nameLabel.text = "Order For: "

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
        cell?.textLabel!.text = selectedOrder?.requests[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    @IBAction func filledButtonPressed(_ sender: UIButton) {
        //clear from order array
        
        //segue back to other view controller
    }
    
    @IBAction func fillOrderButton(_ sender: UIButton) {
        
        FirebaseManager.globalOrders?.remove(at: index!)
        
        //clear from firebase
        
        FirebaseManager.deleteFromOrders(orderName: "Order: \(selectedOrder!.initials!) \(selectedOrder!.yearOfBirth!)") { (success) in
            if success
            {
                print("yaa")
            }
        }
    }
    
    
}
