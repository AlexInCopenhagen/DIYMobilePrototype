//
//  TypeHelper.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 27/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation

@discardableResult
func withSpecificTypes<SpecificStateType, Action>(
    _ action: Action,
    state genericStateType: StateType?,
    function: (_ action: Action, _ state: SpecificStateType?) -> SpecificStateType
    ) -> StateType {
    
    guard let genericStateType = genericStateType else {
        return function(action, nil) as! StateType
    }
    
    guard let specificStateType = genericStateType as? SpecificStateType else {
        return genericStateType
    }
    
    return function(action, specificStateType) as! StateType
}
