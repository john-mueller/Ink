import XCTest
import Ink

final class CodeSpansTests: XCTestCase {

    func testExample328() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `foo`
        """####

        let commonmarkHtml = ####"""
        <p><code>foo</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample329() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `` foo ` bar ``
        """####

        let commonmarkHtml = ####"""
        <p><code>foo ` bar</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample330() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ` `` `
        """####

        let commonmarkHtml = ####"""
        <p><code>``</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample331() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `  ``  `
        """####

        let commonmarkHtml = ####"""
        <p><code> `` </code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample332() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ` a`
        """####

        let commonmarkHtml = ####"""
        <p><code> a</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample333() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ` b `
        """####

        let commonmarkHtml = ####"""
        <p><code> b </code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample334() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ` `
        `  `
        """####

        let commonmarkHtml = ####"""
        <p><code> </code>
        <code>  </code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample335() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ``
        foo
        bar  
        baz
        ``
        """####

        let commonmarkHtml = ####"""
        <p><code>foo bar   baz</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample336() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ``
        foo 
        ``
        """####

        let commonmarkHtml = ####"""
        <p><code>foo </code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample337() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `foo   bar 
        baz`
        """####

        let commonmarkHtml = ####"""
        <p><code>foo   bar  baz</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample338() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `foo\`bar`
        """####

        let commonmarkHtml = ####"""
        <p><code>foo\</code>bar`</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample339() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ``foo`bar``
        """####

        let commonmarkHtml = ####"""
        <p><code>foo`bar</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample340() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ` foo `` bar `
        """####

        let commonmarkHtml = ####"""
        <p><code>foo `` bar</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample341() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo`*`
        """####

        let commonmarkHtml = ####"""
        <p>*foo<code>*</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample342() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [not a `link](/foo`)
        """####

        let commonmarkHtml = ####"""
        <p>[not a <code>link](/foo</code>)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample343() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `<a href="`">`
        """####

        let commonmarkHtml = ####"""
        <p><code>&lt;a href=&quot;</code>&quot;&gt;`</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample344() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href="`">`
        """####

        let commonmarkHtml = ####"""
        <p><a href="`">`</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample345() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `<http://foo.bar.`baz>`
        """####

        let commonmarkHtml = ####"""
        <p><code>&lt;http://foo.bar.</code>baz&gt;`</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample346() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <http://foo.bar.`baz>`
        """####

        let commonmarkHtml = ####"""
        <p><a href="http://foo.bar.%60baz">http://foo.bar.`baz</a>`</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample347() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ```foo``
        """####

        let commonmarkHtml = ####"""
        <p>```foo``</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample348() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `foo
        """####

        let commonmarkHtml = ####"""
        <p>`foo</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample349() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `foo``bar``
        """####

        let commonmarkHtml = ####"""
        <p>`foo<code>bar</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension CodeSpansTests {
    static var allTests = [
        ("testExample328", testExample328),
        ("testExample329", testExample329),
        ("testExample330", testExample330),
        ("testExample331", testExample331),
        ("testExample332", testExample332),
        ("testExample333", testExample333),
        ("testExample334", testExample334),
        ("testExample335", testExample335),
        ("testExample336", testExample336),
        ("testExample337", testExample337),
        ("testExample338", testExample338),
        ("testExample339", testExample339),
        ("testExample340", testExample340),
        ("testExample341", testExample341),
        ("testExample342", testExample342),
        ("testExample343", testExample343),
        ("testExample344", testExample344),
        ("testExample345", testExample345),
        ("testExample346", testExample346),
        ("testExample347", testExample347),
        ("testExample348", testExample348),
        ("testExample349", testExample349),
    ]
}