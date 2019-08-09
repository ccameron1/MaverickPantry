//
//  ResourcesViewController.swift
//  MaverickPantry
//
//  Created by Keegan Brown on 8/8/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var selectionController: UISegmentedControl!
    @IBOutlet weak var resourcesTableView: UITableView!
    
    let onCampusResources = ["CAPS", "Financial Services"]
    let offCampusResources = ["Stuff", "Things" , "MORE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resourcesTableView.delegate = self
        resourcesTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        switch selectionController.selectedSegmentIndex{
        case 0:
            //this is on campus
            print ("ON CAMPUS")
            rows = onCampusResources.count
        case 1:
            //this is off campus
            print ("OFF CAMPUS")
            rows = offCampusResources.count
        default:
            break;
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {            let cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        switch selectionController.selectedSegmentIndex{
        case 0:
            cell?.textLabel?.text = onCampusResources[indexPath.row]
        case 1:
            cell?.textLabel?.text = offCampusResources[indexPath.row]
        default:
            break;
        }
        return cell!
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
            resourcesTableView.reloadData()
        }
    
    
}
