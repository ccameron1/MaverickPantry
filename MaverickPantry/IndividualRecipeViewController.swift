//
//  IndividualRecipeViewController.swift
//  MaverickPantry
//
//  Created by Justine Linscott on 6/24/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class IndividualRecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ingredients : [String] = ["Eggs", "Milk"]
    var name : String = ""
    
    var chiliIngredients : [String] = ["2 cans diced tomatoes, drained", "2 cans black beans, drained and rinsed", "3 Tbsp chili powder", "1 tsp ground cumin", "1 tsp ground pepper", "2 Tbsp olive oil", "½ water or vegetable broth", "1 small green bell pepper, chopped (optional)", "1 onion, chopped (optional)", "1 cup shredded cheese (to serve)", "½ cup sour cream (to serve)"]
    var soupIngredients : [String] = ["1 can black beans, drained and rinsed", "1 can diced tomatoes, drained", "1 can sweet corn, drained", "1 can chicken breast, drained", "1 can pinto beans, drained and rinsed", "1 can red or green enchilada sauce", "1 can (or 1 ¼ cups) chicken broth", "1 bag tortilla chips", "2 cups shredded Mexican cheese (optional)", "¾ cups sour cream (optional)"]
    var peanutBallsIngredients : [String] = ["1/2 cup quinoa, well rinsed", "1 cup water", "1/4 natural peanut butter", "2 teaspoons maple syrup or honey", "1/2 teaspoons cinnamon", "Salt"]
    var chickPeaIngredients : [String] = ["1 can chickpeas, drain and reserve liquid", "1/2 cupt applesauce", "1/2 cup breadcrumbs", "1/2 tablespoon garlic powder", "1/2 teaspoon salt (to taste)", "1/2 teaspoon black pepper"]
    var burgerIngredients : [String] = ["1 can black beans, drained and rinsed", "1 teaspoon garlic powder", "1/4 teaspoon cayenne pepper", "1/2 teaspoon cumin", "1/2 teaspoon salt", "1/4 cup cornmeal/breadcrumbs"]
    var chipIngredients : [String] = ["Vegetable oil", "Tortillas", "Salt"]
    var chiliDirections = "1. Heat olive oil in a large pot over medium high heat. Add ground beef. Using a wooden spoon or spatula, break the beef into equally-sized chunks as it cooks. \n2. Add bell pepper and onion. Cook until beef browns and onion becomes translucent, stirring occasionally. \n3. Reduce heat and add tomatoes, black beans, seasoning, and vegetable broth. \n4. Simmer for 30 minutes or until beans are soft. \n5. To serve, top with shredded cheese and sour cream."
    var soupDirections = "1. Combine all ingredients in a stock pot over medium heat. \n2. Simmer for 5-10 minutes. \n3. To serve, top with tortilla chips, sour cream, and cheese."
    var peanutBallsDirections = "1. In a saucepan, combine the quinoa and water. Bring it to a bail, stir once and cover the pot. Reduce the heat and allow to simmer until all the water is absorbed, about 10-15 minutes. \n2. Allow quinoa to cool. Add the rest of the ingredients and stir well. \n3. Form the mixture into 1 inch balls and place them in the freezer for about 30 minutes to firm. Store in refridgerator. This should make about 20 balls"
    var chickPeaDirections = "1. Blend or mash chickpeas \n2. Mix together chickpeas, applesauce, breadcrumbs, garlic powder, salt, and black pepper. \n3. The consistency should be easy to roll into balls without cracking or sticking to your hands. If too dry, add small amounts of chickpea liquid, if too sticky add small amounts of breadcrumbs. \n4. Form chickpeans mixture into balls and place on a greased baking dish. \n5. In a 450F oven, bake balls for 20-25 minutes, turning over halfway. \n6. Serve."
    var burgerDirections = "1. Preheat oven to 375F. \n2. In a large bowl, microwave black beans for 1 minute, or until softened. \n3. Add garlic powder, cayenne cumin, and salt. Mash until black beans are finely mashed. \n4. Add cornmeal or breadcrumbs and mix until thoroughly combined. \n5. Portion 5 patties and place onto a lightly greased sheet pan, parchment paper lined works best. \n6. Bake for 30 minutes, flipping over half way. Serve."
    var chipDirections = "1. Preheat oven to 350F, apply a thin cooking of oil onto a baking tray \n2. Plce one tortilla on a cutting board and brush the top with a light layer of oil. Place another tortilla on top of the oiled one and repeat. Continue for desired amount of tortillas. \n3. Cut the tortillas into wedges. \n4. Arrange tortilla wedges in a single layer on the oiled tray with the not oiled side of the tortilla brown. \n6. Remove and cool. Store in an airtight container"
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
        foodNameLabel.text = name
        if name == "Chili" {
            servingsLabel.text = "4"
            cookTimeLabel.text = "50m"
            textView.text = chiliDirections
        } else if name == "Seven Can Chicken Tortilla Soup" {
            servingsLabel.text = "6"
            cookTimeLabel.text = "15m"
            textView.text = soupDirections
        } else if name == "Peanut Butter Quinoa Balls" {
            servingsLabel.text = "20 balls"
            cookTimeLabel.text = "50m"
            textView.text = peanutBallsDirections
        } else if name == "Vegan Chickpea Meatballs" {
            servingsLabel.text = "10 balls"
            cookTimeLabel.text = "40m"
            textView.text = chickPeaDirections
        } else if name == "Black Bean Burgers" {
            servingsLabel.text = "5"
            cookTimeLabel.text = "40m"
            textView.text = burgerDirections
        } else if name == "Baked Tortilla Chips" {
            servingsLabel.text = "??"
            cookTimeLabel.text = "30m"
            textView.text = peanutBallsDirections
        }
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
        if row == 0 {
            return chiliIngredients.count
        } else if row == 1 {
            return soupIngredients.count
        } else if row == 2 {
            return peanutBallsIngredients.count
        } else if row == 3 {
            return chickPeaIngredients.count
        } else if row == 4 {
            return burgerIngredients.count
        } else if row == 5 {
            return chipIngredients.count
        } else {
        return ingredients.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if row == 0 {
            let list = chiliIngredients[indexPath.row]
            cell?.textLabel!.text = list
        } else if row == 1 {
            let list = soupIngredients[indexPath.row]
            cell?.textLabel!.text = list
        } else if row == 2 {
            let list = peanutBallsIngredients[indexPath.row]
            cell?.textLabel!.text = list
        }  else if row == 3 {
            let list = chickPeaIngredients[indexPath.row]
            cell?.textLabel!.text = list
        } else if row == 4 {
            let list = burgerIngredients[indexPath.row]
            cell?.textLabel!.text = list
        } else if row == 5 {
            let list = chipIngredients[indexPath.row]
            cell?.textLabel!.text = list
        } else {
            let list = ingredients[indexPath.row]
            cell?.textLabel!.text = list
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
