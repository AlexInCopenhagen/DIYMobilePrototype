//
//  TestDataProvider.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 09/01/2017.
//  Copyright © 2017 Alex Saberdine. All rights reserved.
//

import Foundation

class TestDataProvider {
    
   public func getLongMessage() -> String {
        let randomNumber = arc4random_uniform(4)
        
        switch randomNumber {
        case 0:
            return "Invoice no 22 to \(getName()) has just been paid (send a confirmation to \(getName())"
        case 1:
            return "VAT is due in 3 days - have all expenses been scanned already?"
        case 2:
            return "Invoice no 22 to \(getName()) has just been paid (send a confirmation to \(getName()))"
        case 3:
            return "VAT is due in 3 days - have all expenses been scanned already?"
        case 4:
            return "Once a group of 500 people were attending a seminar. Suddenly the\n speaker stopped and decided to do a group activity. He started giving\n each person a balloon. Each person was then asked to write their name\n on it using a marker pen. Then all the balloons were collected and put in\n another room."
        default:
            return "UNDEFINED"
        }
    }
    
    public func getShortMessage() -> String {
        let randomNumber = arc4random_uniform(4)
        
        switch randomNumber {
        case 0:
            return "\(getName()) commented on your invoice."
        case 1:
            return "Invoice no 22 to \(getName()) has just been paid."
        case 2:
            return "VAT is due in 3 days."
        case 3:
            return "\(getName()) sent you an invoice."
        case 4:
            return "Invoice 42 is past due."
        default:
            return "UNDEFINED"
        }
    }
    
    public func getMessageTitle() -> String {
        
        let randomNumber = arc4random_uniform(4)
        
        switch randomNumber {
        case 0:
            return "Important Message"
        case 1:
            return "PLEASE READ"
        case 2:
            return "WARNING"
        case 3:
            return "Urgent Action Needed"
        case 4:
            return "Action Message"
        default:
            return "UNDEFINED"
        }
    }
    
     public func getName() -> String {
        
        let randomNumber = arc4random_uniform(4)
        
        switch randomNumber {
        case 0:
            return "Hasse"
        case 1:
            return "Peder"
        case 2:
            return "Erik"
        case 3:
            return "Stine"
        case 4:
            return "Viktoria"
        default:
            return "UNDEFINED"
        }
    }

    
}
