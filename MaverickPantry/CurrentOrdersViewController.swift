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
    
    @IBOutlet var tableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Current Orders"
        
//        noOrderLabel.text = "No Orders"
//        noOrderLabel.isHidden = true
        
    }
    
// tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return currentOrder.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        cell?.textLabel!.text = "BirthDate"
        cell?.detailTextLabel!.text = "Initials"
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
}
