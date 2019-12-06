import XCTest
import Ink

final class TabsTests: XCTestCase {

    func testExample1() {
        let parser = MarkdownParser()

        let markdown = ####"""
        	foo	baz		bim
        """####

        let commonmarkHtml = ####"""
        <pre><code>foo	baz		bim
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample2() {
        let parser = MarkdownParser()

        let markdown = ####"""
          	foo	baz		bim
        """####

        let commonmarkHtml = ####"""
        <pre><code>foo	baz		bim
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample3() {
        let parser = MarkdownParser()

        let markdown = ####"""
            a	a
            ὐ	a
        """####

        let commonmarkHtml = ####"""
        <pre><code>a	a
        ὐ	a
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample4() {
        let parser = MarkdownParser()

        let markdown = ####"""
          - foo
        
        	bar
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>foo</p>
        <p>bar</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample5() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        
        		bar
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>foo</p>
        <pre><code>  bar
        </code></pre>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample6() {
        let parser = MarkdownParser()

        let markdown = ####"""
        >		foo
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <pre><code>  foo
        </code></pre>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample7() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -		foo
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <pre><code>  foo
        </code></pre>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample8() {
        let parser = MarkdownParser()

        let markdown = ####"""
            foo
        	bar
        """####

        let commonmarkHtml = ####"""
        <pre><code>foo
        bar
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample9() {
        let parser = MarkdownParser()

        let markdown = ####"""
         - foo
           - bar
        	 - baz
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>baz</li>
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

    func testExample10() {
        let parser = MarkdownParser()

        let markdown = ####"""
        #	Foo
        """####

        let commonmarkHtml = ####"""
        <h1>Foo</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample11() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *	*	*	
        """####

        let commonmarkHtml = ####"""
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension TabsTests {
    static var allTests = [
        ("testExample1", testExample1),
        ("testExample2", testExample2),
        ("testExample3", testExample3),
        ("testExample4", testExample4),
        ("testExample5", testExample5),
        ("testExample6", testExample6),
        ("testExample7", testExample7),
        ("testExample8", testExample8),
        ("testExample9", testExample9),
        ("testExample10", testExample10),
        ("testExample11", testExample11),
    ]
}