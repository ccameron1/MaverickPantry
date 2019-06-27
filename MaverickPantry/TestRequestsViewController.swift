//
//  TestRequestsViewController.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/23/19.
//  Additional modifications by Carly Cameron and Patrick Stacey-Vargas.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TestRequestsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var proteins = ["Natural Creamy Peanut Butter", "Solid White Albacore Tuna", "White Premium Chunk Chicken Breast", "Organic Black Beans", "Garbanzo Beans"]
    
    var vegetables = ["Whole Kernel Sweet Corn", "Diced Tomatoes", "Cut Green Beans"]
    
    var fruits = ["Sliced Yellow Peaches", "Mandarin Oranges"]
    
    var grains = ["Cinnamon and Raisin Granola", "Organic Shells and White Cheddar", "Toasted Whole Grain Oats Cereal", "Oats and Flax Instant Oatmeal", "Organic Whole Wheat Spaghetti", "Brown Basmati Rice", "White Rice"]
    
    var additional = ["Ground Black Pepper", "Organic Marinara Sauce", "Organic Alfredo Pasta Sauce", "Organic Tomato Soup", "Organic Lentil Soup", "Organic Chicken Noodle Soup"]
    
    var miscellaneous = ["Toilet Paper", "Paper Towel"]
    
    var personalHygiene = ["Menstruation Tampons", "Menstruation Pads", "Soap Bar", "Shampoo", "Conditioner", "Toothpaste"]
    
    var foodTypeNames = ["Protein", "Vegetable", "Fruit", "Grain", "Additional Food", "Miscellaneous", "Personal Hygiene"]
    
    var imageArray : [[UIImage]] = []
    var selectedItemImages : [UIImage] = []
    
    var tab1Images : [UIImage] = [UIImage.init(named: "PeanutButter")!, UIImage.init(named: "Tuna")!, UIImage.init(named: "ChickenBreast")!, UIImage.init(named: "BlackBeans")!, UIImage.init(named: "GarbanzoBeans")!]
    var tab2Images : [UIImage] = [UIImage.init(named: "SweetCorn")!, UIImage.init(named: "Tomatoes")!, UIImage.init(named: "GreenBeans")!]
    var tab3Images : [UIImage] = [UIImage.init(named: "Peaches")!, UIImage.init(named: "Mandarins")!]
    var tab4Images : [UIImage] = [UIImage.init(named: "Granola")!, UIImage.init(named: "ShellsAndCheese")!, UIImage.init(named: "Cheerios")!, UIImage.init(named: "Oatmeal")!, UIImage.init(named: "Spaghetti")!, UIImage.init(named: "BrownRice")!, UIImage.init(named: "WhiteRice")!]
    var tab5Images : [UIImage] = [UIImage.init(named: "Peppercorns")!, UIImage.init(named: "Marinara")!, UIImage.init(named: "Alfredo")!, UIImage.init(named: "TomatoSoup")!, UIImage.init(named: "LentilSoup")!, UIImage.init(named: "ChickenNoodle")!]
    var tab6Images : [UIImage] = [UIImage.init(named: "ToiletPaper")!, UIImage.init(named: "PaperTowels")!]
    var tab7Images : [UIImage] = [UIImage.init(named: "Tampon")!, UIImage.init(named: "Pads")!, UIImage.init(named: "Soap")!, UIImage.init(named: "Shampoo")!, UIImage.init(named: "Conditioner")!, UIImage.init(named: "Toothpaste")!]
    
    var selectedItems: [String] = []
    var globalFoodArr: [String] = []
    var tabSelected = 0
    
    var tab1Lables : [String] = ["0", "0", "0", "0", "0",]
    var tab2Lables : [String] = ["0", "0", "0"]
    var tab3Lables : [String] = ["0", "0"]
    var tab4Lables : [String] = ["0", "0", "0", "0", "0", "0", "0"]
    var tab5Lables : [String] = ["0", "0", "0", "0", "0", "0"]
    var tab6Labels : [String] = ["0", "0"]
    var tab7Labels : [String] = ["0", "0", "0", "0", "0", "0"]
    
    var tabLables : [[String]] = []
    
    var count = 0
    var personalItemCount = 0
    
    @IBOutlet weak var totalItemsSelectedLabel: UILabel!
    @IBOutlet weak var collectionViewA: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    @IBOutlet weak var collectionViewC: UICollectionView!
    @IBOutlet weak var totalFoodItemsSelectedLabel: UILabel!
    
    override func viewDidLoad() {
        // Initialize the collection views, set the desired frames
        // UNO Red = 0xD71920
        
        globalFoodArr = proteins
        tabLables = [tab1Lables, tab2Lables, tab3Lables, tab4Lables, tab5Lables, tab6Labels, tab7Labels]
        imageArray = [tab1Images, tab2Images, tab3Images, tab4Images, tab5Images, tab6Images, tab7Images]
        
        if !FirebaseManager.currentUser!.isEmailVerified {
            throwAlertController()
            
        } else {
            let instructionsAC = UIAlertController(title: "Welcome To The Requests Page", message: "To request an item, tap the + button.  To remove an item, tab the - button.  You can request up to ten (10) food or miscellaneous items and any amount of personal hygiene items.  Scroll through the categories of food and their items page to see available options.", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            instructionsAC.addAction(okayAction)
            
            present(instructionsAC, animated: true, completion: nil)
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if !FirebaseManager.currentUser!.isEmailVerified {
            throwAlertController()
            
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                self.throwAlertController()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
            Auth.auth().addStateDidChangeListener { auth, user in
                if FirebaseManager.currentUser == user {
                    print("User is signed in.")
                } else {
                    FirebaseManager.currentUser = user
                    FirebaseManager.currentUserId = ""
                    print("User is signed out.")
                }
            }
        }
        
    }
    
    
    
    func throwAlertController() {
       
        
        let alertController = UIAlertController(title: "Unable to Access Requests", message: "You have not yet verified your email address. Please verify your email and re-login in order to make a request.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (okAction) in
            self.performSegue(withIdentifier: "goBackToHomeSegue", sender: nil)
        }
        let resendAction = UIAlertAction(title: "Resend Email", style: .default) { (resendAction) in
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("sent")
                }
            }
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            self.performSegue(withIdentifier: "goBackToHomeSegue", sender: nil)
        }
        alertController.addAction(okAction)
        alertController.addAction(resendAction)
        self.present(alertController, animated: true)
    }
    
    //collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewA {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            
            cellA.myLabel.text = selectedItems[indexPath.item]
            cellA.imageView.setRounded()
            cellA.imageView.layer.borderColor = UIColor.lightGray.cgColor
            cellA.imageView.image = selectedItemImages[indexPath.item]
            
            return cellA
            
        } else if collectionView == collectionViewB {
            
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            
            cellB.myLabel.text = globalFoodArr[indexPath.item]
            
            if Int(cellB.itemNumberLable.text!)! > 0 {
                cellB.imageView.layer.borderColor = UIColor.red.cgColor
            }
            
            cellB.itemNumberLable.text = tabLables[tabSelected][indexPath.item]
            cellB.imageView.image = imageArray[tabSelected][indexPath.item]
            cellB.imageView.setRounded()
            if cellB.itemNumberLable.text != "0" {
                cellB.imageView.layer.borderColor = UIColor.red.cgColor
            } else {
                cellB.imageView.layer.borderColor = UIColor.lightGray.cgColor
            }
            
            
            cellB.btnTapAction = {
                () in
                print("Edit tapped in cell", indexPath)
                // update lable and add to correct lable array
                let num = Int(cellB.itemNumberLable!.text!)
                var full = false
                
                if self.tabSelected != 6 {
                    if self.count == 10 {
                        full = true
                    } else {
                        self.count = self.count + 1
                        self.personalItemCount += self.personalItemCount
                    }
                }
                
                
                if self.tabSelected != 6 {
                    if num! >= 0 && num! < 10 && self.count <= 10 && !full {
                        
                        cellB.itemNumberLable.text = "\(num! + 1)"
                        self.tabLables[self.tabSelected][indexPath.row] = cellB.itemNumberLable.text!
                        
                    }
                } else {
                    if num! >= 0 && num! < 2 {
                        cellB.itemNumberLable.text = "\(num! + 1)"
                        self.tabLables[self.tabSelected][indexPath.row] = cellB.itemNumberLable.text!
                        
                    } else {
                        print("more than 2")
                        let alertController = UIAlertController.init(title: "Max Of This Item Reached", message: "You have reached the maximum number of this personal item. You can still add more of another personal item.", preferredStyle: .alert)
                        let alertAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: false)
                        //
                        full = true
                    }
                }
                
                
                
                if Int(cellB.itemNumberLable.text!)! > 0 {
                    cellB.imageView.layer.borderColor = UIColor.red.cgColor
                }
                
                if self.count <= 10 && !full {
                    
                    self.selectedItems.insert(self.globalFoodArr[indexPath.row], at: 0)
                    self.totalItemsSelectedLabel.text = "\(self.selectedItems.count)"
                    self.totalFoodItemsSelectedLabel.text = "\(self.count)"
                    self.selectedItemImages.insert(cellB.imageView.image!, at: 0)
                    self.collectionViewA.reloadData()
                    
                } else if full && self.count == 10 {
                    
                    let alertController = UIAlertController.init(title: "Max Food Items Reached", message: "You have reached the maximum number of food items. Please remove an item in its respective category before adding more.", preferredStyle: .alert)
                    let alertAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    self.present(alertController, animated: false)
                    //
                    print("Already have 10 items")
                    
                }
                
            }
            
            cellB.subBtnTapAction = {
                () in
                print("subtract", indexPath)
                let num = Int(cellB.itemNumberLable!.text!)
                var empty = false
                if self.tabSelected != 6 {
                    if self.count == 0 {
                        empty = true
                    } else {
                        self.count = self.count - 1
                    }
                }
                if num! > 0 && num! <= 10 {
                    
                    cellB.itemNumberLable.text = "\(num! - 1)"
                    self.tabLables[self.tabSelected][indexPath.row] = cellB.itemNumberLable.text!
                    
                    
                    
                }
                
                
                
                if Int(cellB.itemNumberLable.text!)! == 0 {
                    cellB.imageView.layer.borderColor = UIColor.lightGray.cgColor
                    
                }
                
                if self.count >= 0 && num! != 0 && !empty {
                    
                    let index = self.selectedItems.firstIndex(of: "\(self.globalFoodArr[indexPath.row])")
                    self.selectedItems.remove(at: index!)
                    self.totalItemsSelectedLabel.text = "\(self.selectedItems.count)"
                    self.totalFoodItemsSelectedLabel.text = "\(self.count)"
                    self.selectedItemImages.remove(at: index!)
                    self.collectionViewA.reloadData()
                    
                } else if self.selectedItems.count == 0 {
                    
                    let alertController = UIAlertController.init(title: "Cannot Remove Item", message: "The item could not be removed from your order because your order is already empty.", preferredStyle: .alert)
                    let alertAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    self.present(alertController, animated: false)
                    
                    //                    cellB.itemNumberLable.text = "\(num!)"
                    print("There is nothing to subtract")
                } else if num! == 0 {
                    
                    let alertController = UIAlertController.init(title: "Cannot Remove Item", message: "The item could not be removed from your order because your order does not contain the item.", preferredStyle: .alert)
                    let alertAction = UIAlertAction.init(title: "Okay", style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    self.present(alertController, animated: false)
                    
                    cellB.itemNumberLable.text = "\(num!)"
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
            case 5:
                globalFoodArr = miscellaneous
            case 6:
                globalFoodArr = personalHygiene
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
                FirebaseManager.addRequestsToUser(requests: self.selectedItems, completion: { (canAddOrders) in
                    if canAddOrders {
                        let order = self.makeOrder()
                        FirebaseManager.addOrder(order: order, completion: { (success) in
                            if success {
                                FirebaseManager.getOrders(completion: { (orders, error) in
                                    if error == nil {
                                        FirebaseManager.globalOrders = orders
                                        print(FirebaseManager.globalOrders?.count)
                                    }
                                })
                            }
                        })
                    }
                    else {
                        let alertController = UIAlertController(title: "Invalid", message: "You have already submitted 2 requests this week. Please call 555-555-5555 if you need another request or this is incorrect.", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alertController.addAction(action)
                        self.present(alertController, animated: true)
                    }
                    
                })
                //add order
            }
            
            
        }
        count = 0
        selectedItems = []
        collectionViewA.reloadData()
        totalItemsSelectedLabel.text = "0"
        totalFoodItemsSelectedLabel.text = "0"
        tab1Lables = ["0", "0", "0", "0", "0",]
        tab2Lables = ["0", "0", "0"]
        tab3Lables = ["0", "0"]
        tab4Lables = ["0", "0", "0", "0", "0", "0", "0"]
        tab5Lables = ["0", "0", "0", "0", "0", "0"]
        tab6Labels = ["0", "0"]
        tab7Labels = ["0", "0", "0", "0", "0", "0"]
        tabLables = [tab1Lables, tab2Lables, tab3Lables, tab4Lables, tab5Lables, tab6Labels, tab7Labels]
        collectionViewB.reloadData()
        let alertController = UIAlertController(title: "Order Submitted!", message: "Your order has been successfully recorded. You will recieve a notification when your order is ready for pickup.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
        
    }
    
    func makeOrder() -> Order{
        let requests = selectedItems
        let initials = FirebaseManager.globalUser.initials
        let yearOfBirth = FirebaseManager.globalUser.yearOfBirth
        let timeStamp = NSDate().timeIntervalSince1970
        
        return Order(requests: requests, intitials: initials, yearOfBirth: yearOfBirth, timestamp: timeStamp, isReady: false)
    }
    
}


extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
        
        self.layer.borderWidth = 2
        
        //self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

extension UICollectionView {
    
    func scrollToLastIndexPath(position:UICollectionView.ScrollPosition, animated: Bool) {
        self.layoutIfNeeded()
        
        for sectionIndex in (0..<self.numberOfSections).reversed() {
            if self.numberOfItems(inSection: sectionIndex) > 0 {
                self.scrollToItem(at: IndexPath.init(item: self.numberOfItems(inSection: sectionIndex)-1, section: sectionIndex), at: position, animated: animated)
                break
            }
        }
    }
    
}
