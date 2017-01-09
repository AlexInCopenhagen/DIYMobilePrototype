//
//  TestData.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 28/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation


//MARK:- Customer
struct Customer {
    var customerName:String
    var customerAddress:[String:String]
}


//MARK:- Product
struct Product {
    var productName:String
    var productPrice:Double
}



//MARK:- Invoices
struct Invoice:Equatable {
    
    enum invoiceState{
        case draft
        case unpaid
        case paid
        case overdue
    }
    
    var invoiceState:invoiceState
    var invoiceTitle:String
    var customer:Customer
    var product:Product
    var totalAmount:NSNumber
    var dueDate:Date
    var id:Int
    
    init(_ id:Int, invoiceState:invoiceState,invoiceTitle:String, customer:Customer, product:Product, totalAmount:NSNumber, dueDate:Date) {
        self.invoiceState = invoiceState
        self.invoiceTitle = invoiceTitle
        self.customer = customer
        self.product = product
        self.totalAmount = totalAmount
        self.dueDate = dueDate
        self.id = id
    }
    static func == (left: Invoice, right: Invoice) -> Bool {
        return left.id == right.id && left.id == right.id
    }
}
