//
//  StepperTableViewCell.swift
//  MaverickPantry
//
//  Created by Joseph Barkley on 6/20/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class StepperTableViewCell: UITableViewCell {

    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodAmountLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var cellID = 0
    var savedStepperValues : [Double] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stepper.value = 0.0
        foodAmountLabel.text = "\(stepper.value)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func stepperDidIncrement(_ sender: UIStepper) {
        savedStepperValues[cellID] = stepper.value
        foodAmountLabel.text = "\(stepper.value)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stepper.value = savedStepperValues[cellID]
        foodAmountLabel.text = "\(stepper.value)"
    }
    
}
