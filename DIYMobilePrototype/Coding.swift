//
//  Coding.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 27/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation

public protocol Coding {
    init?(dictionary: [String:Any])
    var dictionaryRepresentation: [String:Any] {get}
}
