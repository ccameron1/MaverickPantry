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
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return currentOrder.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        return cell!
    }

}
