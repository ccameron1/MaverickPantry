//
//  IndividualRecipeViewController.swift
//  MaverickPantry
//
//  Created by Justine Linscott on 6/24/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class IndividualRecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedRecipe : Recipe!
    var row = -1
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(row)
        textView.isHidden = true
        title = "Recipe"
        foodNameLabel.text = selectedRecipe.recipeName
        servingsLabel.text = selectedRecipe.recipeServing
        cookTimeLabel.text = selectedRecipe.cookTime
        textView.text = selectedRecipe.recipeDirections
        detailTextView.text = selectedRecipe.recipeDescription
    }
    
    @IBAction func segmentedController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableView.isHidden = false
            textView.isHidden = true
        case 1:
            textView.isHidden = false
            tableView.isHidden = true
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedRecipe.ingredients!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        let selectedIngredients = selectedRecipe.ingredients
        let list = selectedIngredients![indexPath.row]
        cell?.textLabel!.text = list
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
