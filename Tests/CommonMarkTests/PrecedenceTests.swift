import XCTest
import Ink

final class PrecedenceTests: XCTestCase {

    func testExample12() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - `one
        - two`
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>`one</li>
        <li>two`</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension PrecedenceTests {
    static var allTests = [
        ("testExample12", testExample12),
    ]
}