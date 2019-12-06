import XCTest
import Ink

final class ListsTests: XCTestCase {

    func testExample271() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        - bar
        + baz
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        </ul>
        <ul>
        <li>baz</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample272() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1. foo
        2. bar
        3) baz
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>foo</li>
        <li>bar</li>
        </ol>
        <ol start="3">
        <li>baz</li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample273() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        - bar
        - baz
        """####

        let commonmarkHtml = ####"""
        <p>Foo</p>
        <ul>
        <li>bar</li>
        <li>baz</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample274() {
        let parser = MarkdownParser()

        let markdown = ####"""
        The number of windows in my house is
        14.  The number of doors is 6.
        """####

        let commonmarkHtml = ####"""
        <p>The number of windows in my house is
        14.  The number of doors is 6.</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample275() {
        let parser = MarkdownParser()

        let markdown = ####"""
        The number of windows in my house is
        1.  The number of doors is 6.
        """####

        let commonmarkHtml = ####"""
        <p>The number of windows in my house is</p>
        <ol>
        <li>The number of doors is 6.</li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample276() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        
        - bar
        
        
        - baz
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>foo</p>
        </li>
        <li>
        <p>bar</p>
        </li>
        <li>
        <p>baz</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample277() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
          - bar
            - baz
        
        
              bim
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>
        <p>baz</p>
        <p>bim</p>
        </li>
        </ul>
        </li>
        </ul>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample278() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        - bar
        
        <!-- -->
        
        - baz
        - bim
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        </ul>
        <!-- -->
        <ul>
        <li>baz</li>
        <li>bim</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample279() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -   foo
        
            notcode
        
        -   foo
        
        <!-- -->
        
            code
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>foo</p>
        <p>notcode</p>
        </li>
        <li>
        <p>foo</p>
        </li>
        </ul>
        <!-- -->
        <pre><code>code
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample280() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
         - b
          - c
           - d
          - e
         - f
        - g
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>a</li>
        <li>b</li>
        <li>c</li>
        <li>d</li>
        <li>e</li>
        <li>f</li>
        <li>g</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample281() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1. a
        
          2. b
        
           3. c
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>c</p>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample282() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
         - b
          - c
           - d
            - e
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>a</li>
        <li>b</li>
        <li>c</li>
        <li>d
        - e</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample283() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1. a
        
          2. b
        
            3. c
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        </ol>
        <pre><code>3. c
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample284() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
        - b
        
        - c
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>c</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample285() {
        let parser = MarkdownParser()

        let markdown = ####"""
        * a
        *
        
        * c
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li></li>
        <li>
        <p>c</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample286() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
        - b
        
          c
        - d
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        <p>c</p>
        </li>
        <li>
        <p>d</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample287() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
        - b
        
          [ref]: /url
        - d
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>d</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample288() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
        - ```
          b
        
        
          ```
        - c
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>a</li>
        <li>
        <pre><code>b
        
        
        </code></pre>
        </li>
        <li>c</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample289() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
          - b
        
            c
        - d
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>a
        <ul>
        <li>
        <p>b</p>
        <p>c</p>
        </li>
        </ul>
        </li>
        <li>d</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample290() {
        let parser = MarkdownParser()

        let markdown = ####"""
        * a
          > b
          >
        * c
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>a
        <blockquote>
        <p>b</p>
        </blockquote>
        </li>
        <li>c</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample291() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
          > b
          ```
          c
          ```
        - d
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>a
        <blockquote>
        <p>b</p>
        </blockquote>
        <pre><code>c
        </code></pre>
        </li>
        <li>d</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample292() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>a</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample293() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
          - b
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>a
        <ul>
        <li>b</li>
        </ul>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample294() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1. ```
           foo
           ```
        
           bar
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <pre><code>foo
        </code></pre>
        <p>bar</p>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample295() {
        let parser = MarkdownParser()

        let markdown = ####"""
        * foo
          * bar
        
          baz
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>foo</p>
        <ul>
        <li>bar</li>
        </ul>
        <p>baz</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample296() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - a
          - b
          - c
        
        - d
          - e
          - f
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>a</p>
        <ul>
        <li>b</li>
        <li>c</li>
        </ul>
        </li>
        <li>
        <p>d</p>
        <ul>
        <li>e</li>
        <li>f</li>
        </ul>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension ListsTests {
    static var allTests = [
        ("testExample271", testExample271),
        ("testExample272", testExample272),
        ("testExample273", testExample273),
        ("testExample274", testExample274),
        ("testExample275", testExample275),
        ("testExample276", testExample276),
        ("testExample277", testExample277),
        ("testExample278", testExample278),
        ("testExample279", testExample279),
        ("testExample280", testExample280),
        ("testExample281", testExample281),
        ("testExample282", testExample282),
        ("testExample283", testExample283),
        ("testExample284", testExample284),
        ("testExample285", testExample285),
        ("testExample286", testExample286),
        ("testExample287", testExample287),
        ("testExample288", testExample288),
        ("testExample289", testExample289),
        ("testExample290", testExample290),
        ("testExample291", testExample291),
        ("testExample292", testExample292),
        ("testExample293", testExample293),
        ("testExample294", testExample294),
        ("testExample295", testExample295),
        ("testExample296", testExample296),
    ]
}