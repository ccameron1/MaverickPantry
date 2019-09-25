//
//  ResourceDetailViewController.swift
//  MaverickPantry
//
//  Created by Keegan Brown on 9/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class ResourceDetailViewController: UIViewController {
    
    @IBOutlet weak var orgImageView: UIImageView!
    @IBOutlet weak var orgNameLabel: UILabel!
    @IBOutlet weak var orgDescTextField: UITextView!
    @IBOutlet weak var contactInfoTextView: UITextView!
    
    var selectedResource : ResourceItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        orgImageView.image = selectedResource!.image
        orgNameLabel.text = selectedResource!.name!
        let descString = selectedResource!.desc!
        orgDescTextField.text = descString
        let addressString = NSAttributedString(string : "Address: ", attributes: [.foregroundColor : UIColor.white])
        let address = NSAttributedString(string: selectedResource!.address, attributes: [.foregroundColor : UIColor.red])
        
        let phoneString = NSAttributedString(string : "\nPhone Number: ", attributes: [.foregroundColor : UIColor.white])
        let phoneNum = NSAttributedString(string: selectedResource!.phoneNumber, attributes: [.foregroundColor : UIColor.red])
        
        let webString = NSAttributedString(string : "\nWebsite: ", attributes: [.foregroundColor : UIColor.white])
        let link = NSAttributedString(string: selectedResource!.link, attributes: [.foregroundColor : UIColor.red])
        
        let stringToAdd = NSMutableAttributedString()
        
        stringToAdd.append(addressString)
        stringToAdd.append(address)
        stringToAdd.append(phoneString)
        stringToAdd.append(phoneNum)
        stringToAdd.append(webString)
        stringToAdd.append(link)
        
        stringToAdd.addAttributes([.font : UIFont(name: "HelveticaNeue", size: 16.0)!], range: NSRange(location: 0, length: stringToAdd.length))
        
        contactInfoTextView.attributedText = stringToAdd
        
        //mostly working. still need to underline the hyperlinks and look into the weird image glitch.

    }
    
}
