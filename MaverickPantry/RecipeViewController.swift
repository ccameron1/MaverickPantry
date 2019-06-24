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
    
    var recipes : [String] = ["pasta", "pizza", "soup", "eggs", "sandwich"]
    var recipeName : [String] = ["Pasta", "Pizza", "Soup", "Eggs", "Sandwich"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! RecipeCollectionViewCell
        let list = recipes[indexPath.row]
        let name = recipeName[indexPath.row]
        cell.imageView.image = UIImage(named: list)
        cell.foodLabel.text = name
        cell.imageView.addShadow()
        return cell
    }
}
