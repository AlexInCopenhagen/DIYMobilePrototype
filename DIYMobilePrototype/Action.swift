//
//  Action.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 21/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation


private let typeKey = "type"
private let payloadKey = "payload"
private let isTypedActionKey = "isTypedAction"
private let reSwiftNull = "Reswift_null"

public struct ReSwiftInit: Action {}
public struct StandardAction: Action {
    
    public let type: String
    public let payload: [String:Any]?
    public let isTypedAction:Bool
    
    public init(type:String, payload:[String:Any]? = nil, isTypedAction:Bool = false) {
        self.type = type
        self.payload = payload
        self.isTypedAction = isTypedAction
    }
}

public protocol Action {}
public protocol StandardActionConvertible: Action {
    init(_ standardAction:StandardAction)
    func toStandardAction() -> StandardAction
}





extension StandardAction: Coding {
    public init?(dictionary:[String:Any]) {
        guard let type = dictionary[typeKey] as? String,
            let isTypedAction = dictionary[isTypedActionKey] as? Bool else {return nil}
        
        self.type = type
        self.payload = dictionary[payloadKey] as? [String:Any]
        self.isTypedAction = isTypedAction
    }
    
    public var dictionaryRepresentation: [String:Any] {
        let payload: Any = self.payload as Any? ?? reSwiftNull as Any
        
        return [typeKey: type as NSString,
                payloadKey: payload,
                isTypedActionKey: isTypedAction as NSNumber]
    }
}





