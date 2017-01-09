//
//  CreateInvoiceViewController.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 29/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import UIKit

class CreateInvoiceViewController: UIViewController {
    @IBOutlet weak var productSelectionTableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.productSelectionTableview.rowHeight = 75
        
    
    }


}

extension CreateInvoiceViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")!
        return cell
    }
}
