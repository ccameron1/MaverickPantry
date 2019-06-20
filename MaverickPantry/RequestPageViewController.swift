//
//  RequestPageViewController.swift
//  MaverickPantry
//
//  Created by Patrick Stacey-Vargus on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class RequestPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var foodTypes : [[String]] = []
    var foodTypeNames = ["Protein", "Vegetable", "Fruit", "Grain", "Additional Food", "Miscellaneous", "Personal Hygiene"]
    var foodNames = [""]
    var proteins = [""]
    var vegetables = [""]
    var fruits = [""]
    var grains = [""]
    var additional = [""]
    var miscellaneous = [""]
    var personalHygiene = [""]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! StepperTableViewCell
        return cell
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
    }
    
}
