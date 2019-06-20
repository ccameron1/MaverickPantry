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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! UITableViewCell
        cell.textLabel?.text = foodName
        cell.detailTextLabel?.text = "Left: \(amountLeft)\nGiven Out: \(amountGiven)"
        return cell
    }
    
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! InventoryDetailViewController
        dvc.amountLeft = amountLeft
        dvc.amountGiven = amountGiven
        dvc.foodName = foodName
    }
    
    
    

}
