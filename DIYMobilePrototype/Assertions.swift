//
//  Assertions.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 27/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation

internal func raiseFatalError(_ message: @autoclosure () -> String = "",
                              file: StaticString = #file, line: UInt = #line) -> Never {
    Assertions.fatalErrorClosure(message(), file, line)
    repeat {
        RunLoop.current.run()
    } while (true)
}


internal class Assertions {
    internal static var fatalErrorClosure = swiftFatalErrorClosure
    internal static let swiftFatalErrorClosure: (String, StaticString, UInt) -> Void
        = { Swift.fatalError($0, file: $1, line: $2) }
}
