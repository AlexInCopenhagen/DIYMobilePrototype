//
//  LargeFlowItemTableViewCell.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 02/01/2017.
//  Copyright © 2017 Alex Saberdine. All rights reserved.
//

import UIKit

class LargeFlowItemTableViewCell: UITableViewCell {

    @IBOutlet weak var bckgrndView: UIView!
    
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var reminderButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.bckgrndView.backgroundColor = .white
        self.bckgrndView.layer.cornerRadius = 10
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    @IBAction func sendButtonAction(_ sender: Any) {
    }
    @IBAction func commentButtonAction(_ sender: Any) {
    }
    @IBAction func reminderButtonAction(_ sender: Any) {
    }
    
    
}
