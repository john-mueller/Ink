import XCTest
import Ink

final class FencedCodeBlocksTests: XCTestCase {

    func testExample89() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        <
         >
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>&lt;
         &gt;
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample90() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ~~~
        <
         >
        ~~~
        """####

        let commonmarkHtml = ####"""
        <pre><code>&lt;
         &gt;
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample91() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ``
        foo
        ``
        """####

        let commonmarkHtml = ####"""
        <p><code>foo</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample92() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        aaa
        ~~~
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        ~~~
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample93() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ~~~
        aaa
        ```
        ~~~
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        ```
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample94() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ````
        aaa
        ```
        ``````
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        ```
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample95() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ~~~~
        aaa
        ~~~
        ~~~~
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        ~~~
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample96() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code></code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample97() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `````
        
        ```
        aaa
        """####

        let commonmarkHtml = ####"""
        <pre><code>
        ```
        aaa
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample98() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > ```
        > aaa
        
        bbb
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <pre><code>aaa
        </code></pre>
        </blockquote>
        <p>bbb</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample99() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        
          
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>
          
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample100() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code></code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample101() {
        let parser = MarkdownParser()

        let markdown = ####"""
         ```
         aaa
        aaa
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        aaa
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample102() {
        let parser = MarkdownParser()

        let markdown = ####"""
          ```
        aaa
          aaa
        aaa
          ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        aaa
        aaa
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample103() {
        let parser = MarkdownParser()

        let markdown = ####"""
           ```
           aaa
            aaa
          aaa
           ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
         aaa
        aaa
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample104() {
        let parser = MarkdownParser()

        let markdown = ####"""
            ```
            aaa
            ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>```
        aaa
        ```
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample105() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        aaa
          ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample106() {
        let parser = MarkdownParser()

        let markdown = ####"""
           ```
        aaa
          ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample107() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        aaa
            ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
            ```
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample108() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ``` ```
        aaa
        """####

        let commonmarkHtml = ####"""
        <p><code> </code>
        aaa</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample109() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ~~~~~~
        aaa
        ~~~ ~~
        """####

        let commonmarkHtml = ####"""
        <pre><code>aaa
        ~~~ ~~
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample110() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo
        ```
        bar
        ```
        baz
        """####

        let commonmarkHtml = ####"""
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        <p>baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample111() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo
        ---
        ~~~
        bar
        ~~~
        # baz
        """####

        let commonmarkHtml = ####"""
        <h2>foo</h2>
        <pre><code>bar
        </code></pre>
        <h1>baz</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample112() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```ruby
        def foo(x)
          return 3
        end
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code class="language-ruby">def foo(x)
          return 3
        end
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample113() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ~~~~    ruby startline=3 $%@#$
        def foo(x)
          return 3
        end
        ~~~~~~~
        """####

        let commonmarkHtml = ####"""
        <pre><code class="language-ruby">def foo(x)
          return 3
        end
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample114() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ````;
        ````
        """####

        let commonmarkHtml = ####"""
        <pre><code class="language-;"></code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample115() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ``` aa ```
        foo
        """####

        let commonmarkHtml = ####"""
        <p><code>aa</code>
        foo</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample116() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ~~~ aa ``` ~~~
        foo
        ~~~
        """####

        let commonmarkHtml = ####"""
        <pre><code class="language-aa">foo
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample117() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        ``` aaa
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code>``` aaa
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension FencedCodeBlocksTests {
    static var allTests = [
        ("testExample89", testExample89),
        ("testExample90", testExample90),
        ("testExample91", testExample91),
        ("testExample92", testExample92),
        ("testExample93", testExample93),
        ("testExample94", testExample94),
        ("testExample95", testExample95),
        ("testExample96", testExample96),
        ("testExample97", testExample97),
        ("testExample98", testExample98),
        ("testExample99", testExample99),
        ("testExample100", testExample100),
        ("testExample101", testExample101),
        ("testExample102", testExample102),
        ("testExample103", testExample103),
        ("testExample104", testExample104),
        ("testExample105", testExample105),
        ("testExample106", testExample106),
        ("testExample107", testExample107),
        ("testExample108", testExample108),
        ("testExample109", testExample109),
        ("testExample110", testExample110),
        ("testExample111", testExample111),
        ("testExample112", testExample112),
        ("testExample113", testExample113),
        ("testExample114", testExample114),
        ("testExample115", testExample115),
        ("testExample116", testExample116),
        ("testExample117", testExample117),
    ]
}