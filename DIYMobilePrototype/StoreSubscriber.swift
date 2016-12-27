//
//  StoreSubscriber.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 21/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation

public protocol AnyStoreSubscriber: class {
    func _newState(state: Any)
}

public protocol StoreSubscriber: AnyStoreSubscriber {
    associatedtype StoreSubscriberStateType
    
    func newState(state:StoreSubscriberStateType)
}

extension StoreSubscriber {
    public func _newState(state: Any) {
        if let typedState = state as? StoreSubscriberStateType {
            newState(state: typedState)
        }
    }
}
