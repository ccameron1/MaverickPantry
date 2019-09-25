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
    
    var onCampusResources : [ResourceItem] = []
    var offCampusResources : [ResourceItem] = []
    
    var selectedResource : ResourceItem?
    
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
            cell?.imageView?.image = onCampusResources[indexPath.row].image
        case 1:
            cell?.textLabel?.text = offCampusResources[indexPath.row].name
            cell?.imageView?.image = offCampusResources[indexPath.row].image
        default:
            break;
        }
        return cell!
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        resourcesTableView.reloadData()
    }
    
    func createAndAddResources(){
        
        //add code for on campus - Grayson
        let caps = ResourceItem(name: "CAPS", desc: "Counseling and Psychological Services, otherwise known as CAPS, offers free services to all UNO students. They are located in room 102 of the H&K Building on UNO's Dodge Campus.", image: UIImage(named: "UNOLogo")! , link: "https://www.unomaha.edu/student-life/wellness/counseling-and-psychological-services", phoneNumber: "(402)554-2409", address: "6323 Maverick Plaza, Omaha, NE 68182")
        onCampusResources.append(caps)
        let financialServices = ResourceItem(name: "Office of Financial Support and Scholarships", desc: "The Office of Financial Support and Scholarships provdes UNO students with information about costs and financial aid as well as tools and resources to help students reach financial success. The office is located in room 103 of the Epply Admin Building.", image: UIImage(named: "UNOLogo")!, link: "https://www.unomaha.edu/admissions/financial-support-and-scholarships/index.php", phoneNumber: "(402)554-2327", address: "6001 University Dr N, Omaha, NE 68132")
        onCampusResources.append(financialServices)
        let acdc = ResourceItem(name: "Academic and Career Development Center", desc: "The Academic and Career Development Center (ACDC) facilitates and develops the academic and career success of students. They are located in room 115 of the Eppley Admin Building.", image: UIImage(named: "UNOLogo")!, link: "https://www.unomaha.edu/student-life/achievement/academic-and-career-development-center/index.php", phoneNumber: "(402)554-3672", address: "6001 University Dr N, Omaha, NE 68132")
        onCampusResources.append(acdc)
        
        //add code for off campus - Keegan
        let CCfoodPantry = ResourceItem(name: "Community Cupboard Church Food Pantry", desc: "This is a food pantry that provides free food by distributing it through a process that resembles a grocery store. Please call to confirm the hours of operation. ", image: UIImage(named: "icon2")!, link: "http://countrysideucc.org/serving-together/community-cupboard/", phoneNumber: "(402)391-0350", address: "13130 Faith Plaza, Omaha, NE 68114")
        offCampusResources.append(CCfoodPantry)
        let togetherInc = ResourceItem(name: "Together Inc.", desc: "This food pantry provides multiple services including resources for food and transportation. Please call to confirm the hours of operation and necessary form(s) of identification.", image: UIImage(named: "icon2")!, link: "http://togetheromaha.org/", phoneNumber: "(402)345-8047", address: "812 S 24th St, Omaha, NE 68108")
        offCampusResources.append(togetherInc)
        let FLfoodPantry = ResourceItem(name: "First Lutheran Church Food Pantry", desc: "This is a food pantry that provides both food and clothing. Please call to confirm the hours of operation and necessary form(s) of identification.", image: UIImage(named: "icon2")!, link: "https://sites.google.com/flcomaha.org/foodpantry", phoneNumber: "(402)345-7506", address: "542 S 31st St, Omaha, NE 68105")
        offCampusResources.append(FLfoodPantry)
        let mavRideBusPass = ResourceItem(name: "Mavride Bus Pass", desc: "This service provides free rides on the Metro Bus System to current faculty, staff, and students. Your MavCARD is activated with the bus pass. This can be used for any route.", image: UIImage(named: "metroLogo")!, link: "www.ometro.com", phoneNumber: "(402)341-0800", address: "2222 Cuming St, Omaha, NE 68102")
        offCampusResources.append(mavRideBusPass)
        let odm = ResourceItem(name: "Open Door Mission", desc: "This facility provides shelter beds, serves hot meals, and provides preventive measures to those in poverty.", image: UIImage(named: "ODMLogo")!, link: "https://www.opendoormission.org/", phoneNumber: "(402)422-1111", address: "2828 N 23rd St E, Omaha, NE 68110")
        offCampusResources.append(odm)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectionController.selectedSegmentIndex == 0 {
            selectedResource = onCampusResources[indexPath.row]
        } else {
            selectedResource = offCampusResources[indexPath.row]
        }
        
        performSegue(withIdentifier: "toResourceDetailSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let RDVC = segue.destination as! ResourceDetailViewController
        RDVC.selectedResource = selectedResource
    }
    
}
