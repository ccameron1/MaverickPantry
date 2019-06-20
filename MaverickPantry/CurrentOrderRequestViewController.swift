//
//  CurrentOrderRequestViewController.swift
//  MaverickPantry
//
//  Created by Justine Linscott on 6/20/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class CurrentOrderRequestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RcellID")
//        let foodType = foodGroup[indexPath.row]
        cell?.textLabel!.text = "food"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    @IBAction func filledButtonPressed(_ sender: UIButton) {
        perform("")
    }
    
    
}
