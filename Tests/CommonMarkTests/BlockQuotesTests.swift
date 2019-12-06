import XCTest
import Ink

final class BlockQuotesTests: XCTestCase {

    func testExample198() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > # Foo
        > bar
        > baz
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample199() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ># Foo
        >bar
        > baz
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample200() {
        let parser = MarkdownParser()

        let markdown = ####"""
           > # Foo
           > bar
         > baz
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample201() {
        let parser = MarkdownParser()

        let markdown = ####"""
            > # Foo
            > bar
            > baz
        """####

        let commonmarkHtml = ####"""
        <pre><code>&gt; # Foo
        &gt; bar
        &gt; baz
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample202() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > # Foo
        > bar
        baz
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample203() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > bar
        baz
        > foo
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>bar
        baz
        foo</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample204() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > foo
        ---
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

    func testExample205() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > - foo
        - bar
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <ul>
        <li>foo</li>
        </ul>
        </blockquote>
        <ul>
        <li>bar</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample206() {
        let parser = MarkdownParser()

        let markdown = ####"""
        >     foo
            bar
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <pre><code>foo
        </code></pre>
        </blockquote>
        <pre><code>bar
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample207() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > ```
        foo
        ```
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <pre><code></code></pre>
        </blockquote>
        <p>foo</p>
        <pre><code></code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample208() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > foo
            - bar
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>foo
        - bar</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample209() {
        let parser = MarkdownParser()

        let markdown = ####"""
        >
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample210() {
        let parser = MarkdownParser()

        let markdown = ####"""
        >
        >  
        > 
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample211() {
        let parser = MarkdownParser()

        let markdown = ####"""
        >
        > foo
        >  
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>foo</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample212() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > foo
        
        > bar
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>foo</p>
        </blockquote>
        <blockquote>
        <p>bar</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample213() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > foo
        > bar
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>foo
        bar</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample214() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > foo
        >
        > bar
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>foo</p>
        <p>bar</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample215() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo
        > bar
        """####

        let commonmarkHtml = ####"""
        <p>foo</p>
        <blockquote>
        <p>bar</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample216() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > aaa
        ***
        > bbb
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>aaa</p>
        </blockquote>
        <hr />
        <blockquote>
        <p>bbb</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample217() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > bar
        baz
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>bar
        baz</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample218() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > bar
        
        baz
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>bar</p>
        </blockquote>
        <p>baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample219() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > bar
        >
        baz
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <p>bar</p>
        </blockquote>
        <p>baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample220() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > > > foo
        bar
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <blockquote>
        <blockquote>
        <p>foo
        bar</p>
        </blockquote>
        </blockquote>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample221() {
        let parser = MarkdownParser()

        let markdown = ####"""
        >>> foo
        > bar
        >>baz
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <blockquote>
        <blockquote>
        <p>foo
        bar
        baz</p>
        </blockquote>
        </blockquote>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample222() {
        let parser = MarkdownParser()

        let markdown = ####"""
        >     code
        
        >    not code
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <pre><code>code
        </code></pre>
        </blockquote>
        <blockquote>
        <p>not code</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension BlockQuotesTests {
    static var allTests = [
        ("testExample198", testExample198),
        ("testExample199", testExample199),
        ("testExample200", testExample200),
        ("testExample201", testExample201),
        ("testExample202", testExample202),
        ("testExample203", testExample203),
        ("testExample204", testExample204),
        ("testExample205", testExample205),
        ("testExample206", testExample206),
        ("testExample207", testExample207),
        ("testExample208", testExample208),
        ("testExample209", testExample209),
        ("testExample210", testExample210),
        ("testExample211", testExample211),
        ("testExample212", testExample212),
        ("testExample213", testExample213),
        ("testExample214", testExample214),
        ("testExample215", testExample215),
        ("testExample216", testExample216),
        ("testExample217", testExample217),
        ("testExample218", testExample218),
        ("testExample219", testExample219),
        ("testExample220", testExample220),
        ("testExample221", testExample221),
        ("testExample222", testExample222),
    ]
}