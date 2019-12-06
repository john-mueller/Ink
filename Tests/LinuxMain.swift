/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import XCTest
import InkTests
import CommonMarkTests

var tests = [XCTestCaseEntry]()
tests += InkTests.allTests()
tests += CommonMarkTests.allTests()
XCTMain(tests)
