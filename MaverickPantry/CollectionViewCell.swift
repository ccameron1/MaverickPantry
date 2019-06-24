//
//  CollectionViewCell.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/23/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var itemNumberLable: UILabel!
    
    
    
    // this will be our "call back" action
    var btnTapAction : (()->())?
    
    var subBtnTapAction : (()->())?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    let addButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+", for: .normal)
        return button
    }()
    
    let subtractButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.setTitle("-", for: .normal)
        return button
    }()
    
    func setupViews(){
        
        // add a button
        addSubview(addButton)
        addSubview(subtractButton)
        
//        addButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        addButton.frame = CGRect(x: 350, y: 20, width: 30, height: 30)
        subtractButton.frame = CGRect(x: 290, y: 20, width: 30, height: 30)
        // add the touchUpInside target
        addButton.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        subtractButton.addTarget(self, action: #selector(subtBtnTapped), for: .touchUpInside)

    }
    
    @objc func btnTapped() {
        print("Tapped!")
        
        // use our "call back" action to tell the controller the button was tapped
        btnTapAction?()
    }
    
    @objc func subtBtnTapped() {
        print("Subtract Tapped!")
        // use our "call back" action to tell the controller the button was tapped
        subBtnTapAction?()
    }

}
