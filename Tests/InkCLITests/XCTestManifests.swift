/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import XCTest

public func allTests() -> [Linux.TestCase] {
    return [
        Linux.makeTestCase(using: InputTests.allTests)
    ]
}
