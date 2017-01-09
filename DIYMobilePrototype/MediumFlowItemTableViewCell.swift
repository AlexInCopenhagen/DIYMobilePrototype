//
//  MediumFlowItemTableViewCell.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 02/01/2017.
//  Copyright © 2017 Alex Saberdine. All rights reserved.
//

import UIKit

class MediumFlowItemTableViewCell: UITableViewCell {

    @IBOutlet weak var bckgrndView: UIView!
    
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var reminderButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.bckgrndView.backgroundColor = .white //UIColor(red: 253/255.0, green: 245/255.0, blue: 230/255.0, alpha: 1.0)
        self.bckgrndView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func sendButtonAction(_ sender: Any) {
    }
    
    @IBAction func commentButtonAction(_ sender: Any) {
    }
    
    @IBAction func reminderButtonAction(_ sender: Any) {
    }
    
    

}
