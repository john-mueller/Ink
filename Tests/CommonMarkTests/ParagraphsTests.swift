import XCTest
import Ink

final class ParagraphsTests: XCTestCase {

    func testExample189() {
        let parser = MarkdownParser()

        let markdown = ####"""
        aaa
        
        bbb
        """####

        let commonmarkHtml = ####"""
        <p>aaa</p>
        <p>bbb</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample190() {
        let parser = MarkdownParser()

        let markdown = ####"""
        aaa
        bbb
        
        ccc
        ddd
        """####

        let commonmarkHtml = ####"""
        <p>aaa
        bbb</p>
        <p>ccc
        ddd</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample191() {
        let parser = MarkdownParser()

        let markdown = ####"""
        aaa
        
        
        bbb
        """####

        let commonmarkHtml = ####"""
        <p>aaa</p>
        <p>bbb</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample192() {
        let parser = MarkdownParser()

        let markdown = ####"""
          aaa
         bbb
        """####

        let commonmarkHtml = ####"""
        <p>aaa
        bbb</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample193() {
        let parser = MarkdownParser()

        let markdown = ####"""
        aaa
                     bbb
                                               ccc
        """####

        let commonmarkHtml = ####"""
        <p>aaa
        bbb
        ccc</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample194() {
        let parser = MarkdownParser()

        let markdown = ####"""
           aaa
        bbb
        """####

        let commonmarkHtml = ####"""
        <p>aaa
        bbb</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample195() {
        let parser = MarkdownParser()

        let markdown = ####"""
            aaa
        bbb
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        </code></pre>
        <p>bbb</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample196() {
        let parser = MarkdownParser()

        let markdown = ####"""
        aaa     
        bbb     
        """####

        let commonmarkHtml = ####"""
        <p>aaa<br />
        bbb</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension ParagraphsTests {
    static var allTests = [
        ("testExample189", testExample189),
        ("testExample190", testExample190),
        ("testExample191", testExample191),
        ("testExample192", testExample192),
        ("testExample193", testExample193),
        ("testExample194", testExample194),
        ("testExample195", testExample195),
        ("testExample196", testExample196),
    ]
}