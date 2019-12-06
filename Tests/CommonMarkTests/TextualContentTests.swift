import XCTest
import Ink

final class TextualContentTests: XCTestCase {

    func testExample647() {
        let parser = MarkdownParser()

        let markdown = ####"""
        hello $.;'there
        """####

        let commonmarkHtml = ####"""
        <p>hello $.;'there</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample648() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo χρῆν
        """####

        let commonmarkHtml = ####"""
        <p>Foo χρῆν</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample649() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Multiple     spaces
        """####

        let commonmarkHtml = ####"""
        <p>Multiple     spaces</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension TextualContentTests {
    static var allTests = [
        ("testExample647", testExample647),
        ("testExample648", testExample648),
        ("testExample649", testExample649),
    ]
}