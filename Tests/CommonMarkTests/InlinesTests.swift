import XCTest
import Ink

final class InlinesTests: XCTestCase {

    func testExample297() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `hi`lo`
        """####

        let commonmarkHtml = ####"""
        <p><code>hi</code>lo`</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension InlinesTests {
    static var allTests = [
        ("testExample297", testExample297),
    ]
}