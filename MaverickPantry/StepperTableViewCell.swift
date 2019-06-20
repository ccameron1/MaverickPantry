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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func stepperDidIncrement(_ sender: UIStepper) {
        
    }
    
}
