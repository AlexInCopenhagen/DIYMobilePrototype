//
//  Subscription.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 21/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation

struct Subscription<State:StateType> {
    private(set) weak var subscriber: AnyStoreSubscriber? = nil
    let selector: ((State) -> Any)?
}
