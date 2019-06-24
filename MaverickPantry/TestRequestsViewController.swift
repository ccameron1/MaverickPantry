//
//  TestRequestsViewController.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/23/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class TestRequestsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var proteins = ["Natural Creamy Peanut Butter", "Solid White Albacore Tuna", "White Premium Chunk Chicken Breast", "Organic Black Beans", "Garbanzo Beans"]
    
    var vegetables = ["Whole Kernel Sweet Corn", "Diced Tomatoes", "Cut Green Beans"]
    
    var fruits = ["Sliced Yellow Peaches", "Mandarin Oranges"]
    
    var grains = ["Cinnamon and Raisin Granola", "Organic Shells and White Cheddar", "Toasted Whole Grain Oats Cereal", "Oats and Flax Instant Oatmeal", "Organic Whole Wheat Spaghetti", "Brown Basmati Rice", "White Rice"]
    
    var additional = ["Ground Black Pepper", "Organic Marinara Sauce", "Organic Alfredo Pasta Sauce", "Organic Tomato Soup", "Organic Lentil Soup", "Organic Chicken Noodle Soup"]
    
    var foodTypeNames = ["Protein", "Vegetable", "Fruit", "Grain", "Additional Food", "Miscellaneous", "Personal Hygiene"]
    
    var selectedItems: [String] = []
    var globalFoodArr: [String] = []
    var tabSelected = 0
    
    var tab1Lables : [String] = ["0", "0", "0", "0", "0",]
    var tab2Lables : [String] = ["0", "0", "0"]
    var tab3Lables : [String] = ["0", "0"]
    var tab4Lables : [String] = ["0", "0", "0", "0", "0", "0", "0"]
    var tab5Lables : [String] = ["0", "0", "0", "0", "0", "0"]
    
    var tabLables : [[String]] = []
    @IBOutlet weak var totalItemsSelectedLabel: UILabel!
    @IBOutlet weak var collectionViewA: UICollectionView!
    
    @IBOutlet weak var collectionViewB: UICollectionView!
    @IBOutlet weak var collectionViewC: UICollectionView!
    
    override func viewDidLoad() {
        // Initialize the collection views, set the desired frames
        globalFoodArr = proteins
        tabLables = [tab1Lables, tab2Lables, tab3Lables, tab4Lables, tab5Lables]
    }
    
    
    //collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewA {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            
            cellA.myLabel.text = selectedItems[indexPath.item]
            cellA.imageView.setRounded()
            return cellA
            
        } else if collectionView == collectionViewB {
           
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    
            cellB.myLabel.text = globalFoodArr[indexPath.item]
            
            if Int(cellB.itemNumberLable.text!)! > 0 {
                cellB.imageView.layer.borderColor = UIColor.red.cgColor
            }
            
            cellB.itemNumberLable.text = tabLables[tabSelected][indexPath.item]
            cellB.imageView.setRounded()
            
            
            cellB.btnTapAction = {
                () in
                print("Edit tapped in cell", indexPath)
                // update lable and add to correct lable array
                var num = Int(cellB.itemNumberLable!.text!)
                cellB.itemNumberLable.text = "\(num! + 1)"
                
                
                self.tabLables[self.tabSelected][indexPath.row] = cellB.itemNumberLable.text!
                
                if Int(cellB.itemNumberLable.text!)! > 0 {
                    cellB.imageView.layer.borderColor = UIColor.red.cgColor
                }
                
                if self.selectedItems.count < 10 {
                    self.selectedItems.append(self.globalFoodArr[indexPath.row])
                    self.totalItemsSelectedLabel.text = "\(self.selectedItems.count)"
                    self.collectionViewA.reloadData()
                } else {
                    print("Already have 10 items")
                }
            }
            
            cellB.subBtnTapAction = {
                () in
                print("subract", indexPath)
                var num = Int(cellB.itemNumberLable!.text!)
                cellB.itemNumberLable.text = "\(num! - 1)"
                
                self.tabLables[self.tabSelected][indexPath.row] = cellB.itemNumberLable.text!
                
                if Int(cellB.itemNumberLable.text!)! == 0 {
                    cellB.imageView.layer.borderColor = UIColor.lightGray.cgColor
                    
                }
                
                if self.selectedItems.count > 0 {
                    let index = self.selectedItems.firstIndex(of: "\(self.globalFoodArr[indexPath.row])")
                    self.selectedItems.remove(at: index!)
                    self.totalItemsSelectedLabel.text = "\(self.selectedItems.count)"
                    self.collectionViewA.reloadData()
                    
                } else {
                    print("There is nothing to subtract")
                }
            }
            
            
            return cellB
        } else {
            
            let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            
            cellC.myLabel.text = foodTypeNames[indexPath.item]
            cellC.myLabel.textColor = .lightGray

            if indexPath.row == tabSelected {
                cellC.myLabel.textColor = UIColor.black
            }
            return cellC
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewA {
            return selectedItems.count
        } else if collectionView == collectionViewB {
            return globalFoodArr.count
        } else {
            return foodTypeNames.count
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        if collectionView == collectionViewC {
           
            tabSelected = indexPath.item
            collectionViewB.reloadData()
            
            globalFoodArr = proteins
            switch tabSelected {
            case 0:
                globalFoodArr = proteins
                
            case 1:
                globalFoodArr = vegetables
            case 2:
                globalFoodArr = fruits
            case 3:
                globalFoodArr = grains
            case 4:
                globalFoodArr = additional
            default:
                print("not added yet")
            }
            print("woo")
            collectionViewC.reloadData()
        }
        
    }
    
    @IBAction func sendRequestButton(_ sender: Any) {
        FirebaseManager.clearOldRequests { (success) in
            if success {
                FirebaseManager.addRequestsToUser(requests: self.selectedItems)
            }
        }
    }
    
    
    
}


extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
        
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}


