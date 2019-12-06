import XCTest
import Ink

final class ThematicBreaksTests: XCTestCase {

    func testExample13() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ***
        ---
        ___
        """####

        let commonmarkHtml = ####"""
        <hr />
        <hr />
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample14() {
        let parser = MarkdownParser()

        let markdown = ####"""
        +++
        """####

        let commonmarkHtml = ####"""
        <p>+++</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample15() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ===
        """####

        let commonmarkHtml = ####"""
        <p>===</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample16() {
        let parser = MarkdownParser()

        let markdown = ####"""
        --
        **
        __
        """####

        let commonmarkHtml = ####"""
        <p>--
        **
        __</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample17() {
        let parser = MarkdownParser()

        let markdown = ####"""
         ***
          ***
           ***
        """####

        let commonmarkHtml = ####"""
        <hr />
        <hr />
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample18() {
        let parser = MarkdownParser()

        let markdown = ####"""
            ***
        """####

        let commonmarkHtml = ####"""
        <pre><code>***
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample19() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
            ***
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        ***</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample20() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _____________________________________
        """####

        let commonmarkHtml = ####"""
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample21() {
        let parser = MarkdownParser()

        let markdown = ####"""
         - - -
        """####

        let commonmarkHtml = ####"""
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample22() {
        let parser = MarkdownParser()

        let markdown = ####"""
         **  * ** * ** * **
        """####

        let commonmarkHtml = ####"""
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample23() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -     -      -      -
        """####

        let commonmarkHtml = ####"""
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample24() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - - - -    
        """####

        let commonmarkHtml = ####"""
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample25() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _ _ _ _ a
        
        a------
        
        ---a---
        """####

        let commonmarkHtml = ####"""
        <p>_ _ _ _ a</p>
        <p>a------</p>
        <p>---a---</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample26() {
        let parser = MarkdownParser()

        let markdown = ####"""
         *-*
        """####

        let commonmarkHtml = ####"""
        <p><em>-</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample27() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        ***
        - bar
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        </ul>
        <hr />
        <ul>
        <li>bar</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample28() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        ***
        bar
        """####

        let commonmarkHtml = ####"""
        <p>Foo</p>
        <hr />
        <p>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample29() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        ---
        bar
        """####

        let commonmarkHtml = ####"""
        <h2>Foo</h2>
        <p>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample30() {
        let parser = MarkdownParser()

        let markdown = ####"""
        * Foo
        * * *
        * Bar
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>Foo</li>
        </ul>
        <hr />
        <ul>
        <li>Bar</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample31() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - Foo
        - * * *
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>Foo</li>
        <li>
        <hr />
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension ThematicBreaksTests {
    static var allTests = [
        ("testExample13", testExample13),
        ("testExample14", testExample14),
        ("testExample15", testExample15),
        ("testExample16", testExample16),
        ("testExample17", testExample17),
        ("testExample18", testExample18),
        ("testExample19", testExample19),
        ("testExample20", testExample20),
        ("testExample21", testExample21),
        ("testExample22", testExample22),
        ("testExample23", testExample23),
        ("testExample24", testExample24),
        ("testExample25", testExample25),
        ("testExample26", testExample26),
        ("testExample27", testExample27),
        ("testExample28", testExample28),
        ("testExample29", testExample29),
        ("testExample30", testExample30),
        ("testExample31", testExample31),
    ]
}