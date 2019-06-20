//
//  RequestPageViewController.swift
//  MaverickPantry
//
//  Created by Patrick Stacey-Vargus on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class RequestPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cells : [StepperTableViewCell] = []
    
    var foodTypes : [[String]] = []
    
    var foodTypeNames = ["Protein", "Vegetable", "Fruit", "Grain", "Additional Food", "Miscellaneous", "Personal Hygiene"]
    
    var foodNames = ["Natural Creamy Peanut Butter", "Solid White Albacore Tuna", "White Premium Chunk Chicken Breast", "Organic Black Beans", "Garbanzo Beans", "Whole Kernel Sweet Corn", "Diced Tomatoes", "Cut Green Beans", "Sliced Yellow Peaches", "Mandarin Oranges", "Cinnamon and Raisin Granola", "Organic Shells and White Cheddar", "Toasted Whole Grain Oats Cereal", "Oats and Flax Instant Oatmeal", "Organic Whole Wheat Spaghetti", "Brown Basmati Rice", "White Rice", "Ground Black Pepper", "Organic Marinara Sauce", "Organic Alfredo Pasta Sauce", "Organic Tomato Soup", "Organic Lentil Soup", "Organic Chicken Noodle Soup", "Toilet Paper", "Paper Towel", "Menstruation Tampons", "Menstruation Pads", "Soap Bar", "Shampoo", "Conditioner", "Toothpaste"]
    
    var proteins = ["Natural Creamy Peanut Butter", "Solid White Albacore Tuna", "White Premium Chunk Chicken Breast", "Organic Black Beans", "Garbanzo Beans"]
    
    var vegetables = ["Whole Kernel Sweet Corn", "Diced Tomatoes", "Cut Green Beans"]
    
    var fruits = ["Sliced Yellow Peaches", "Mandarin Oranges"]
    var grains = ["Cinnamon and Raisin Granola", "Organic Shells and White Cheddar", "Toasted Whole Grain Oats Cereal", "Oats and Flax Instant Oatmeal", "Organic Whole Wheat Spaghetti", "Brown Basmati Rice", "White Rice"
    ]
    var additional = ["Ground Black Pepper", "Organic Marinara Sauce", "Organic Alfredo Pasta Sauce", "Organic Tomato Soup", "Organic Lentil Soup", "Organic Chicken Noodle Soup"]
    
    var miscellaneous = ["Toilet Paper", "Paper Towel"]
    
    var personalHygiene = ["Menstruation Tampons", "Menstruation Pads", "Soap Bar", "Shampoo", "Conditioner", "Toothpaste"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTypes = [proteins, vegetables, fruits, grains, additional, miscellaneous, personalHygiene]
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! StepperTableViewCell
        cell.foodNameLabel.text = foodNames[indexPath.row]
        cell.cellID = indexPath.row
        for item in foodTypes{
            let itemIndex = foodTypes.firstIndex(of: item)!
            for stuff in item{
                if cell.foodNameLabel.text == stuff{
                    cell.foodTypeLabel.text = foodTypeNames[itemIndex]
                }
            }
        }
        cells.append(cell)
        return cell
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
<<<<<<< Updated upstream

        //connect this request with specfic firebase user
        
        //if none update the "request1" field and add Timestamp
        
        //else update the "request2" field and add Timestamp
        print(FirebaseManager.currentUserId)
        
        var totalItems = 0.0
        var requestedItems = [""]
        for item in cells{
            let itemValue = Double(item.foodAmountLabel.text!)
            let intItemValue = Int(itemValue!)
            for int in 0...intItemValue{
                requestedItems.append(item.foodNameLabel.text!)
                print(int)
            }
            if item.foodTypeLabel.text != "Personal Hygiene"{
                totalItems += itemValue!
            }
        }
        if totalItems > 10.0{
            let alertController = UIAlertController(title: "Too many items", message: "There is a limit of 10 for items outside of the personal hygiene category", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }else{
            let alertController = UIAlertController(title: "Request Submitted", message: "Your request was successfully submitted", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
=======
        
        

>>>>>>> Stashed changes
    }
    
}
