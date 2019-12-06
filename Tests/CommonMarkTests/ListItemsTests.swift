import XCTest
import Ink

final class ListItemsTests: XCTestCase {

    func testExample223() {
        let parser = MarkdownParser()

        let markdown = ####"""
        A paragraph
        with two lines.
        
            indented code
        
        > A block quote.
        """####

        let commonmarkHtml = ####"""
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample224() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1.  A paragraph
            with two lines.
        
                indented code
        
            > A block quote.
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample225() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - one
        
         two
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>one</li>
        </ul>
        <p>two</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample226() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - one
        
          two
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample227() {
        let parser = MarkdownParser()

        let markdown = ####"""
         -    one
        
             two
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>one</li>
        </ul>
        <pre><code> two
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample228() {
        let parser = MarkdownParser()

        let markdown = ####"""
         -    one
        
              two
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample229() {
        let parser = MarkdownParser()

        let markdown = ####"""
           > > 1.  one
        >>
        >>     two
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <blockquote>
        <ol>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ol>
        </blockquote>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample230() {
        let parser = MarkdownParser()

        let markdown = ####"""
        >>- one
        >>
          >  > two
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <blockquote>
        <ul>
        <li>one</li>
        </ul>
        <p>two</p>
        </blockquote>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample231() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -one
        
        2.two
        """####

        let commonmarkHtml = ####"""
        <p>-one</p>
        <p>2.two</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample232() {
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

    func testExample233() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1.  foo
        
            ```
            bar
            ```
        
            baz
        
            > bam
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        <p>baz</p>
        <blockquote>
        <p>bam</p>
        </blockquote>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample234() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - Foo
        
              bar
        
        
              baz
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>Foo</p>
        <pre><code>bar
        
        
        baz
        </code></pre>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample235() {
        let parser = MarkdownParser()

        let markdown = ####"""
        123456789. ok
        """####

        let commonmarkHtml = ####"""
        <ol start="123456789">
        <li>ok</li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample236() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1234567890. not ok
        """####

        let commonmarkHtml = ####"""
        <p>1234567890. not ok</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample237() {
        let parser = MarkdownParser()

        let markdown = ####"""
        0. ok
        """####

        let commonmarkHtml = ####"""
        <ol start="0">
        <li>ok</li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample238() {
        let parser = MarkdownParser()

        let markdown = ####"""
        003. ok
        """####

        let commonmarkHtml = ####"""
        <ol start="3">
        <li>ok</li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample239() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -1. not ok
        """####

        let commonmarkHtml = ####"""
        <p>-1. not ok</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample240() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        
              bar
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample241() {
        let parser = MarkdownParser()

        let markdown = ####"""
          10.  foo
        
                   bar
        """####

        let commonmarkHtml = ####"""
        <ol start="10">
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample242() {
        let parser = MarkdownParser()

        let markdown = ####"""
            indented code
        
        paragraph
        
            more code
        """####

        let commonmarkHtml = ####"""
        <pre><code>indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample243() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1.     indented code
        
           paragraph
        
               more code
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <pre><code>indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample244() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1.      indented code
        
           paragraph
        
               more code
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <pre><code> indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample245() {
        let parser = MarkdownParser()

        let markdown = ####"""
           foo
        
        bar
        """####

        let commonmarkHtml = ####"""
        <p>foo</p>
        <p>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample246() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -    foo
        
          bar
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        </ul>
        <p>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample247() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -  foo
        
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

    func testExample248() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -
          foo
        -
          ```
          bar
          ```
        -
              baz
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        <li>
        <pre><code>bar
        </code></pre>
        </li>
        <li>
        <pre><code>baz
        </code></pre>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample249() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -   
          foo
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample250() {
        let parser = MarkdownParser()

        let markdown = ####"""
        -
        
          foo
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li></li>
        </ul>
        <p>foo</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample251() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        -
        - bar
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample252() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
        -   
        - bar
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample253() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1. foo
        2.
        3. bar
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample254() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li></li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample255() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo
        *
        
        foo
        1.
        """####

        let commonmarkHtml = ####"""
        <p>foo
        *</p>
        <p>foo
        1.</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample256() {
        let parser = MarkdownParser()

        let markdown = ####"""
         1.  A paragraph
             with two lines.
        
                 indented code
        
             > A block quote.
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample257() {
        let parser = MarkdownParser()

        let markdown = ####"""
          1.  A paragraph
              with two lines.
        
                  indented code
        
              > A block quote.
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample258() {
        let parser = MarkdownParser()

        let markdown = ####"""
           1.  A paragraph
               with two lines.
        
                   indented code
        
               > A block quote.
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample259() {
        let parser = MarkdownParser()

        let markdown = ####"""
            1.  A paragraph
                with two lines.
        
                    indented code
        
                > A block quote.
        """####

        let commonmarkHtml = ####"""
        <pre><code>1.  A paragraph
            with two lines.
        
                indented code
        
            &gt; A block quote.
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample260() {
        let parser = MarkdownParser()

        let markdown = ####"""
          1.  A paragraph
        with two lines.
        
                  indented code
        
              > A block quote.
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample261() {
        let parser = MarkdownParser()

        let markdown = ####"""
          1.  A paragraph
            with two lines.
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>A paragraph
        with two lines.</li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample262() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > 1. > Blockquote
        continued here.
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <ol>
        <li>
        <blockquote>
        <p>Blockquote
        continued here.</p>
        </blockquote>
        </li>
        </ol>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample263() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > 1. > Blockquote
        > continued here.
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <ol>
        <li>
        <blockquote>
        <p>Blockquote
        continued here.</p>
        </blockquote>
        </li>
        </ol>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample264() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
          - bar
            - baz
              - boo
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>baz
        <ul>
        <li>boo</li>
        </ul>
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

    func testExample265() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - foo
         - bar
          - baz
           - boo
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        <li>baz</li>
        <li>boo</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample266() {
        let parser = MarkdownParser()

        let markdown = ####"""
        10) foo
            - bar
        """####

        let commonmarkHtml = ####"""
        <ol start="10">
        <li>foo
        <ul>
        <li>bar</li>
        </ul>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample267() {
        let parser = MarkdownParser()

        let markdown = ####"""
        10) foo
           - bar
        """####

        let commonmarkHtml = ####"""
        <ol start="10">
        <li>foo</li>
        </ol>
        <ul>
        <li>bar</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample268() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - - foo
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <ul>
        <li>foo</li>
        </ul>
        </li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample269() {
        let parser = MarkdownParser()

        let markdown = ####"""
        1. - 2. foo
        """####

        let commonmarkHtml = ####"""
        <ol>
        <li>
        <ul>
        <li>
        <ol start="2">
        <li>foo</li>
        </ol>
        </li>
        </ul>
        </li>
        </ol>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample270() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - # Foo
        - Bar
          ---
          baz
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <h1>Foo</h1>
        </li>
        <li>
        <h2>Bar</h2>
        baz</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension ListItemsTests {
    static var allTests = [
        ("testExample223", testExample223),
        ("testExample224", testExample224),
        ("testExample225", testExample225),
        ("testExample226", testExample226),
        ("testExample227", testExample227),
        ("testExample228", testExample228),
        ("testExample229", testExample229),
        ("testExample230", testExample230),
        ("testExample231", testExample231),
        ("testExample232", testExample232),
        ("testExample233", testExample233),
        ("testExample234", testExample234),
        ("testExample235", testExample235),
        ("testExample236", testExample236),
        ("testExample237", testExample237),
        ("testExample238", testExample238),
        ("testExample239", testExample239),
        ("testExample240", testExample240),
        ("testExample241", testExample241),
        ("testExample242", testExample242),
        ("testExample243", testExample243),
        ("testExample244", testExample244),
        ("testExample245", testExample245),
        ("testExample246", testExample246),
        ("testExample247", testExample247),
        ("testExample248", testExample248),
        ("testExample249", testExample249),
        ("testExample250", testExample250),
        ("testExample251", testExample251),
        ("testExample252", testExample252),
        ("testExample253", testExample253),
        ("testExample254", testExample254),
        ("testExample255", testExample255),
        ("testExample256", testExample256),
        ("testExample257", testExample257),
        ("testExample258", testExample258),
        ("testExample259", testExample259),
        ("testExample260", testExample260),
        ("testExample261", testExample261),
        ("testExample262", testExample262),
        ("testExample263", testExample263),
        ("testExample264", testExample264),
        ("testExample265", testExample265),
        ("testExample266", testExample266),
        ("testExample267", testExample267),
        ("testExample268", testExample268),
        ("testExample269", testExample269),
        ("testExample270", testExample270),
    ]
}