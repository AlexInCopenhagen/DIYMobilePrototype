//
//  DashboardViewController.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 21/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    enum cellTypes{
        case actionableItem
        case informationItem
        case defaultItem
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = .darkGray
        self.configureTableview()
        
    }

    func configureTableview() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 150
        self.tableView.backgroundColor = .clear
        self.tableView.layer.cornerRadius = 5
        
        
    }

}


extension DashboardViewController: UITableViewDelegate {
    
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.35).cgColor
        
        if indexPath.row % 2 == 0 {
              cell.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.75)
            return cell
        }else {
            cell.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.5)
            return cell

        }
    }
    
    
    
}
