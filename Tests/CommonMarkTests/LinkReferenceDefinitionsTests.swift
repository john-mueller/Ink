import XCTest
import Ink

final class LinkReferenceDefinitionsTests: XCTestCase {

    func testExample161() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url "title"
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample162() {
        let parser = MarkdownParser()

        let markdown = ####"""
           [foo]: 
              /url  
                   'the title'  
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="the title">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample163() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [Foo*bar\]]:my_(url) 'title (with parens)'
        
        [Foo*bar\]]
        """####

        let commonmarkHtml = ####"""
        <p><a href="my_(url)" title="title (with parens)">Foo*bar]</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample164() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [Foo bar]:
        <my url>
        'title'
        
        [Foo bar]
        """####

        let commonmarkHtml = ####"""
        <p><a href="my%20url" title="title">Foo bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample165() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url '
        title
        line1
        line2
        '
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="
        title
        line1
        line2
        ">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample166() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url 'title
        
        with blank line'
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p>[foo]: /url 'title</p>
        <p>with blank line'</p>
        <p>[foo]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample167() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]:
        /url
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample168() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]:
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p>[foo]:</p>
        <p>[foo]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample169() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: <>
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p><a href="">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample170() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: <bar>(baz)
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p>[foo]: <bar>(baz)</p>
        <p>[foo]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample171() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url\bar\*baz "foo\"bar\baz"
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url%5Cbar*baz" title="foo&quot;bar\baz">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample172() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]
        
        [foo]: url
        """####

        let commonmarkHtml = ####"""
        <p><a href="url">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample173() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]
        
        [foo]: first
        [foo]: second
        """####

        let commonmarkHtml = ####"""
        <p><a href="first">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample174() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [FOO]: /url
        
        [Foo]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url">Foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample175() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [ΑΓΩ]: /φου
        
        [αγω]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/%CF%86%CE%BF%CF%85">αγω</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample176() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url
        """####

        let commonmarkHtml = ####"""
        
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample177() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [
        foo
        ]: /url
        bar
        """####

        let commonmarkHtml = ####"""
        <p>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample178() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url "title" ok
        """####

        let commonmarkHtml = ####"""
        <p>[foo]: /url &quot;title&quot; ok</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample179() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url
        "title" ok
        """####

        let commonmarkHtml = ####"""
        <p>&quot;title&quot; ok</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample180() {
        let parser = MarkdownParser()

        let markdown = ####"""
            [foo]: /url "title"
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <pre><code>[foo]: /url &quot;title&quot;
        </code></pre>
        <p>[foo]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample181() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```
        [foo]: /url
        ```
        
        [foo]
        """####

        let commonmarkHtml = ####"""
        <pre><code>[foo]: /url
        </code></pre>
        <p>[foo]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample182() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        [bar]: /baz
        
        [bar]
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        [bar]: /baz</p>
        <p>[bar]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample183() {
        let parser = MarkdownParser()

        let markdown = ####"""
        # [Foo]
        [foo]: /url
        > bar
        """####

        let commonmarkHtml = ####"""
        <h1><a href="/url">Foo</a></h1>
        <blockquote>
        <p>bar</p>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample184() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url
        bar
        ===
        [foo]
        """####

        let commonmarkHtml = ####"""
        <h1>bar</h1>
        <p><a href="/url">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample185() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url
        ===
        [foo]
        """####

        let commonmarkHtml = ####"""
        <p>===
        <a href="/url">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample186() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /foo-url "foo"
        [bar]: /bar-url
          "bar"
        [baz]: /baz-url
        
        [foo],
        [bar],
        [baz]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/foo-url" title="foo">foo</a>,
        <a href="/bar-url" title="bar">bar</a>,
        <a href="/baz-url">baz</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample187() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]
        
        > [foo]: /url
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url">foo</a></p>
        <blockquote>
        </blockquote>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample188() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url
        """####

        let commonmarkHtml = ####"""
        
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension LinkReferenceDefinitionsTests {
    static var allTests = [
        ("testExample161", testExample161),
        ("testExample162", testExample162),
        ("testExample163", testExample163),
        ("testExample164", testExample164),
        ("testExample165", testExample165),
        ("testExample166", testExample166),
        ("testExample167", testExample167),
        ("testExample168", testExample168),
        ("testExample169", testExample169),
        ("testExample170", testExample170),
        ("testExample171", testExample171),
        ("testExample172", testExample172),
        ("testExample173", testExample173),
        ("testExample174", testExample174),
        ("testExample175", testExample175),
        ("testExample176", testExample176),
        ("testExample177", testExample177),
        ("testExample178", testExample178),
        ("testExample179", testExample179),
        ("testExample180", testExample180),
        ("testExample181", testExample181),
        ("testExample182", testExample182),
        ("testExample183", testExample183),
        ("testExample184", testExample184),
        ("testExample185", testExample185),
        ("testExample186", testExample186),
        ("testExample187", testExample187),
        ("testExample188", testExample188),
    ]
}