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
    
    let onCampusDummyResources = ["CAPS", "Financial Services"]
    let offCampusDummyResources = ["Stuff", "Things" , "MORE"]
    
    var onCampusResources : [ResourceItem] = []
    var offCampusResources : [ResourceItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAndAddResources()

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
            cell?.textLabel?.text = onCampusResources[indexPath.row].name
            cell?.imageView!.image = onCampusResources[indexPath.row].image
        case 1:
            cell?.textLabel?.text = offCampusResources[indexPath.row].name
            cell?.imageView!.image = offCampusResources[indexPath.row].image
        default:
            break;
        }
        return cell!
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        resourcesTableView.reloadData()
    }
    
    func createAndAddResources(){
        //add code for on campus
        let caps = ResourceItem(name: "CAPS", desc: "Counseling and Psychological Services", image: UIImage(named: "icon2")! , link: "https://www.unomaha.edu/student-life/wellness/counseling-and-psychological-services/index.php", phoneNumber: "(402)554-2409")
        onCampusResources.append(caps)
        //add code for off campus
        let odm = ResourceItem(name: "Open Door Mission", desc: "This facility provides shelter beds, serves hot meals, and provides preventive measures to those in poverty.", image: UIImage(named: "icon2")!, link: "https://www.opendoormission.org/", phoneNumber: "(402)422-1111")
        offCampusResources.append(odm)
    }
    
}
