import XCTest
import Ink

final class SoftLineBreaksTests: XCTestCase {

    func testExample645() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo
        baz
        """####

        let commonmarkHtml = ####"""
        <p>foo
        baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample646() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo 
         baz
        """####

        let commonmarkHtml = ####"""
        <p>foo
        baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension SoftLineBreaksTests {
    static var allTests = [
        ("testExample645", testExample645),
        ("testExample646", testExample646),
    ]
}