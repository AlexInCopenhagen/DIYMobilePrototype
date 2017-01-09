//
//  MockedAPIService.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 02/01/2017.
//  Copyright © 2017 Alex Saberdine. All rights reserved.
//

import Foundation

enum Header {
    case get
    case put
    case post
}

enum APIError{
    case unknownHeader
    case dataFormattingError
    case success
}

class MockedAPIService {
    
    func customer(data:[String:String], header:Header) -> ([String:String],APIError)? {
        
        return (["Customer":"Nisses pölsebod"],APIError.success)
    }
    
    func product(data:[String:String], header:Header) -> ([String:String],APIError)? {
        return (["Product":"Chili Pölse"],APIError.success)
        
    }
    
    func invoice(data:[String:String], header:Header) -> ([String:String],APIError)? {
        return (["Invoice":"IID00001"],APIError.success)
        
    }
}
