//
//  InvoiceOverviewViewController.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 28/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import UIKit

class InvoiceOverviewViewController: UIViewController {
    
    
    
    var currentInvoiceFilter:Invoice.invoiceState = .draft
    
    @IBOutlet weak var invoiceOverviewTableview: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var testDataContainer = [Invoice]()
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentInvoiceFilter = Invoice.invoiceState.draft
        case 1:
            currentInvoiceFilter = Invoice.invoiceState.unpaid
        case 2:
            currentInvoiceFilter = Invoice.invoiceState.paid
        case 3:
            currentInvoiceFilter = Invoice.invoiceState.overdue
        default:
            print("Segmented control grew!! call the ghostbusters")
        }
        self.invoiceOverviewTableview.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.invoiceOverviewTableview.rowHeight = 80
        self.invoiceOverviewTableview.dataSource = self
        self.invoiceOverviewTableview.delegate = self
        
        createTestData(state: .draft, totAm: 1042.00, numberOfInvoices: 5)
        createTestData(state: .unpaid, totAm: 1103.00, numberOfInvoices: 2)
        createTestData(state: .paid, totAm: 1232.00, numberOfInvoices: 8)
        createTestData(state: .overdue, totAm: 45267.00, numberOfInvoices: 1)
        print(testDataContainer.count)
        
    }
    
    
    
    func createTestData(state:Invoice.invoiceState, totAm:NSNumber, numberOfInvoices:Int) {
        for _ in 0..<numberOfInvoices {
            let cust1 = Customer(customerName: "Benny Hana", customerAddress: ["Oldsbrogade 12":"Copenhagen, Denmark"])
            let prod1 = Product(productName: "Sausage", productPrice: 12.5)
            
            let invoice = Invoice(Int(arc4random()),invoiceState: state,invoiceTitle: "Invoice\(arc4random())",customer: cust1, product: prod1, totalAmount: totAm, dueDate: Date())
            testDataContainer.append(invoice)
        }
    }
}

extension InvoiceOverviewViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var returnValue = 0
        for invoice in testDataContainer {
            if invoice.invoiceState == self.currentInvoiceFilter {
                returnValue += 1
            }
        }
        return returnValue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvoiceCell")! as! InvoiceTableViewCell
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.25
        
        for invoice in testDataContainer {
            
            if invoice.invoiceState == self.currentInvoiceFilter {
                cell.invoiceIDLabel.text = testDataContainer[testDataContainer.index(of: invoice)!].invoiceTitle
                cell.invoiceStateLabel.text = "12/28/2016"
                cell.totalAmountLabel.text = "\(self.numberFormatter(amount: testDataContainer[testDataContainer.index(of: invoice)!].totalAmount)) DKK"
                cell.invoiceCustomerLabel.text = "Nisses Pølsebod A/S"
                
                switch self.currentInvoiceFilter {
                case .draft:
                    cell.actionButton.setTitle(" Send ", for: .normal)
                case .unpaid:
                    cell.actionButton.setTitle(" Request Payment ", for: .normal)
                case .paid:
                    cell.actionButton.setTitle(" Archive ", for: .normal)
                case .overdue:
                    cell.actionButton.setTitle(" Send Reminder ", for: .normal)
                }
                cell.actionButton.sizeToFit()
            }
        }
        return cell
    }
    
    func numberFormatter(amount:NSNumber) -> String {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        
        return nf.string(from: amount)!
    }
    
    
}
