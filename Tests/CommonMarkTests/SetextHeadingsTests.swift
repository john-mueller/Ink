import XCTest
import Ink

final class SetextHeadingsTests: XCTestCase {

    func testExample50() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo *bar*
        =========
        
        Foo *bar*
        ---------
        """####

        let commonmarkHtml = ####"""
        <h1>Foo <em>bar</em></h1>
        <h2>Foo <em>bar</em></h2>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample51() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo *bar
        baz*
        ====
        """####

        let commonmarkHtml = ####"""
        <h1>Foo <em>bar
        baz</em></h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample52() {
        let parser = MarkdownParser()

        let markdown = ####"""
          Foo *bar
        baz*	
        ====
        """####

        let commonmarkHtml = ####"""
        <h1>Foo <em>bar
        baz</em></h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample53() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        -------------------------
        
        Foo
        =
        """####

        let commonmarkHtml = ####"""
        <h2>Foo</h2>
        <h1>Foo</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample54() {
        let parser = MarkdownParser()

        let markdown = ####"""
           Foo
        ---
        
          Foo
        -----
        
          Foo
          ===
        """####

        let commonmarkHtml = ####"""
        <h2>Foo</h2>
        <h2>Foo</h2>
        <h1>Foo</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample55() {
        let parser = MarkdownParser()

        let markdown = ####"""
            Foo
            ---
        
            Foo
        ---
        """####

        let commonmarkHtml = ####"""
        <pre><code>Foo
        ---
        
        Foo
        </code></pre>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample56() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
           ----      
        """####

        let commonmarkHtml = ####"""
        <h2>Foo</h2>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample57() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
            ---
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        ---</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample58() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        = =
        
        Foo
        --- -
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        = =</p>
        <p>Foo</p>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample59() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo  
        -----
        """####

        let commonmarkHtml = ####"""
        <h2>Foo</h2>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample60() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo\
        ----
        """####

        let commonmarkHtml = ####"""
        <h2>Foo\</h2>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample61() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `Foo
        ----
        `
        
        <a title="a lot
        ---
        of dashes"/>
        """####

        let commonmarkHtml = ####"""
        <h2>`Foo</h2>
        <p>`</p>
        <h2>&lt;a title=&quot;a lot</h2>
        <p>of dashes&quot;/&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample62() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > Foo
        ---
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>Foo</p>
        </blockquote>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample63() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > foo
        bar
        ===
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>foo
        bar
        ===</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample64() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - Foo
        ---
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>Foo</li>
        </ul>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample65() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        Bar
        ---
        """####

        let commonmarkHtml = ####"""
        <h2>Foo
        Bar</h2>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample66() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ---
        Foo
        ---
        Bar
        ---
        Baz
        """####

        let commonmarkHtml = ####"""
        <hr />
        <h2>Foo</h2>
        <h2>Bar</h2>
        <p>Baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample67() {
        let parser = MarkdownParser()

        let markdown = ####"""
        
        ====
        """####

        let commonmarkHtml = ####"""
        <p>====</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample68() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ---
        ---
        """####

        let commonmarkHtml = ####"""
        <hr />
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample69() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        -----
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        </ul>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample70() {
        let parser = MarkdownParser()

        let markdown = ####"""
            foo
        ---
        """####

        let commonmarkHtml = ####"""
        <pre><code>foo
        </code></pre>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample71() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > foo
        -----
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>foo</p>
        </blockquote>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample72() {
        let parser = MarkdownParser()

        let markdown = ####"""
        \> foo
        ------
        """####

        let commonmarkHtml = ####"""
        <h2>&gt; foo</h2>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample73() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        
        bar
        ---
        baz
        """####

        let commonmarkHtml = ####"""
        <p>Foo</p>
        <h2>bar</h2>
        <p>baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample74() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        bar
        
        ---
        
        baz
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        bar</p>
        <hr />
        <p>baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample75() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        bar
        * * *
        baz
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        bar</p>
        <hr />
        <p>baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample76() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        bar
        \---
        baz
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        bar
        ---
        baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension SetextHeadingsTests {
    static var allTests = [
        ("testExample50", testExample50),
        ("testExample51", testExample51),
        ("testExample52", testExample52),
        ("testExample53", testExample53),
        ("testExample54", testExample54),
        ("testExample55", testExample55),
        ("testExample56", testExample56),
        ("testExample57", testExample57),
        ("testExample58", testExample58),
        ("testExample59", testExample59),
        ("testExample60", testExample60),
        ("testExample61", testExample61),
        ("testExample62", testExample62),
        ("testExample63", testExample63),
        ("testExample64", testExample64),
        ("testExample65", testExample65),
        ("testExample66", testExample66),
        ("testExample67", testExample67),
        ("testExample68", testExample68),
        ("testExample69", testExample69),
        ("testExample70", testExample70),
        ("testExample71", testExample71),
        ("testExample72", testExample72),
        ("testExample73", testExample73),
        ("testExample74", testExample74),
        ("testExample75", testExample75),
        ("testExample76", testExample76),
    ]
}