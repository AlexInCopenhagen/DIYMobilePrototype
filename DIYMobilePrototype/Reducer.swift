//
//  Reducer.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 21/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation

public typealias Reducer<ReducerStateType> = (_ action:Action, _ state: ReducerStateType?) -> ReducerStateType?
