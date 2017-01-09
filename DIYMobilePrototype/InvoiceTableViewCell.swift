//
//  InvoiceTableViewCell.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 28/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import UIKit

class InvoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var invoiceStateLabel: UILabel!
    @IBOutlet weak var invoiceIDLabel: UILabel!
    @IBOutlet weak var invoiceCustomerLabel: UILabel!
    
    @IBOutlet weak var actionButton: UIButton!
    @IBAction func actionButtonAction(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
        self.actionButton.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
