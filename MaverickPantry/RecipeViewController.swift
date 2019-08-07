//
//  RecipeViewController.swift
//  MaverickPantry
//
//  Created by Patrick Stacey-Vargus on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var recipes : [String] = ["pasta", "pizza", "soup", "eggs"]
    var recipeName : [String] = ["Chili", "Seven Can Chicken Tortilla Soup", "Peanut Butter Quinoa Balls", "Vegan Chickpea Meatballs", "Black Bean Burgers", "Baked Tortilla Chips"]
    var time : [String] = ["50 minutes", "15 minutes", "50 minutes", "40 minutes", "40 minutes", "30 minutes"]
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! RecipeCollectionViewCell
        let time = self.time[indexPath.row]
//        let list = recipes[indexPath.row]
        let name = recipeName[indexPath.row]
        cell.imageView.image = UIImage(named: "eggs")
        cell.foodLabel.text = name
        cell.timeLabel.text = time
        cell.imageView.addShadow()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.indexPath = indexPath
        performSegue(withIdentifier: "recipeSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! IndividualRecipeViewController
        dvc.name = recipeName[(indexPath?.row)!]
        dvc.row = indexPath!.row
    }
}
