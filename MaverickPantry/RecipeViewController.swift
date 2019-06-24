//
//  RecipeViewController.swift
//  MaverickPantry
//
//  Created by Patrick Stacey-Vargus on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recipes = ["Cake", "Pie", "Cheese"]
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellID"
        
        var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UITableViewCell
        
        cell.textLabel!.text = self.recipes[indexPath.row]
        
        var image : UIImage = UIImage(named: "foodpantrybanner")!
        print("The loaded image: \(image)")
        cell.imageView!.image = image
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
//    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
//    {
//        let cellIdentifier = "cellID"
//
//        var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UITableViewCell
//
//        cell.textLabel!.text = self.recipes[indexPath.row]
//
//        var image : UIImage = UIImage(named: "foodpantrybanner")!
//        print("The loaded image: \(image)")
//        cell.imageView!.image = image
//
//        return cell
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
