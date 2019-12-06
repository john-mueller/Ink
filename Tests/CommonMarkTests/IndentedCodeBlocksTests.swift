import XCTest
import Ink

final class IndentedCodeBlocksTests: XCTestCase {

    func testExample77() {
        let parser = MarkdownParser()

        let markdown = ####"""
            a simple
              indented code block
        """####

        let commonmarkHtml = ####"""
        <pre><code>a simple
          indented code block
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample78() {
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

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample79() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1.  foo
        
            - bar
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>foo</p>
        <ul>
        <li>bar</li>
        </ul>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample80() {
        let parser = MarkdownParser()

        let markdown = ####"""
            <a/>
            *hi*
        
            - one
        """####

        let commonmarkHtml = ####"""
        <pre><code>&lt;a/&gt;
        *hi*
        
        - one
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample81() {
        let parser = MarkdownParser()

        let markdown = ####"""
            chunk1
        
            chunk2
          
         
         
            chunk3
        """####

        let commonmarkHtml = ####"""
        <pre><code>chunk1
        
        chunk2
        
        
        
        chunk3
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample82() {
        let parser = MarkdownParser()

        let markdown = ####"""
            chunk1
              
              chunk2
        """####

        let commonmarkHtml = ####"""
        <pre><code>chunk1
          
          chunk2
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample83() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
            bar
        
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample84() {
        let parser = MarkdownParser()

        let markdown = ####"""
            foo
        bar
        """####

        let commonmarkHtml = ####"""
        <pre><code>foo
        </code></pre>
        <p>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample85() {
        let parser = MarkdownParser()

        let markdown = ####"""
        # Heading
            foo
        Heading
        ------
            foo
        ----
        """####

        let commonmarkHtml = ####"""
        <h1>Heading</h1>
        <pre><code>foo
        </code></pre>
        <h2>Heading</h2>
        <pre><code>foo
        </code></pre>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample86() {
        let parser = MarkdownParser()

        let markdown = ####"""
                foo
            bar
        """####

        let commonmarkHtml = ####"""
        <pre><code>    foo
        bar
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample87() {
        let parser = MarkdownParser()

        let markdown = ####"""
        
            
            foo
            
        
        """####

        let commonmarkHtml = ####"""
        <pre><code>foo
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample88() {
        let parser = MarkdownParser()

        let markdown = ####"""
            foo  
        """####

        let commonmarkHtml = ####"""
        <pre><code>foo  
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension IndentedCodeBlocksTests {
    static var allTests = [
        ("testExample77", testExample77),
        ("testExample78", testExample78),
        ("testExample79", testExample79),
        ("testExample80", testExample80),
        ("testExample81", testExample81),
        ("testExample82", testExample82),
        ("testExample83", testExample83),
        ("testExample84", testExample84),
        ("testExample85", testExample85),
        ("testExample86", testExample86),
        ("testExample87", testExample87),
        ("testExample88", testExample88),
    ]
}