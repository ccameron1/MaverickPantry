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
    
    var recipes : [Recipe] = []
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! RecipeCollectionViewCell
        FirebaseManager.getRecipes { (recipes, err) in
            if err == nil {
                self.recipes = recipes
                let time = recipes[indexPath.row].recipeTime
                //        let list = recipes[indexPath.row]
                let name = recipes[indexPath.row].recipeName
                cell.imageView.image = UIImage(named: "eggs")
                cell.foodLabel.text = name
                cell.timeLabel.text = time
                cell.imageView.addShadow()
            } else {
                print("error")
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.indexPath = indexPath
        performSegue(withIdentifier: "recipeSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! IndividualRecipeViewController
        dvc.selectedRecipe = recipes[indexPath!.row]
    }
    
    
}
