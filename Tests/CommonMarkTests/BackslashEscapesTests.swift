import XCTest
import Ink

final class BackslashEscapesTests: XCTestCase {

    func testExample298() {
        let parser = MarkdownParser()

        let markdown = ####"""
        \!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~
        """####

        let commonmarkHtml = ####"""
        <p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample299() {
        let parser = MarkdownParser()

        let markdown = ####"""
        \	\A\a\ \3\φ\«
        """####

        let commonmarkHtml = ####"""
        <p>\	\A\a\ \3\φ\«</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample300() {
        let parser = MarkdownParser()

        let markdown = ####"""
        \*not emphasized*
        \<br/> not a tag
        \[not a link](/foo)
        \`not code`
        1\. not a list
        \* not a list
        \# not a heading
        \[foo]: /url "not a reference"
        \&ouml; not a character entity
        """####

        let commonmarkHtml = ####"""
        <p>*not emphasized*
        &lt;br/&gt; not a tag
        [not a link](/foo)
        `not code`
        1. not a list
        * not a list
        # not a heading
        [foo]: /url &quot;not a reference&quot;
        &amp;ouml; not a character entity</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample301() {
        let parser = MarkdownParser()

        let markdown = ####"""
        \\*emphasis*
        """####

        let commonmarkHtml = ####"""
        <p>\<em>emphasis</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample302() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo\
        bar
        """####

        let commonmarkHtml = ####"""
        <p>foo<br />
        bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample303() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `` \[\` ``
        """####

        let commonmarkHtml = ####"""
        <p><code>\[\`</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample304() {
        let parser = MarkdownParser()

        let markdown = ####"""
            \[\]
        """####

        let commonmarkHtml = ####"""
        <pre><code>\[\]
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample305() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ~~~
        \[\]
        ~~~
        """####

        let commonmarkHtml = ####"""
        <pre><code>\[\]
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample306() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <http://example.com?find=\*>
        """####

        let commonmarkHtml = ####"""
        <p><a href="http://example.com?find=%5C*">http://example.com?find=\*</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample307() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href="/bar\/)">
        """####

        let commonmarkHtml = ####"""
        <a href="/bar\/)">
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample308() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo](/bar\* "ti\*tle")
        """####

        let commonmarkHtml = ####"""
        <p><a href="/bar*" title="ti*tle">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample309() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]
        
        [foo]: /bar\* "ti\*tle"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/bar*" title="ti*tle">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample310() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ``` foo\+bar
        foo
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code class="language-foo+bar">foo
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension BackslashEscapesTests {
    static var allTests = [
        ("testExample298", testExample298),
        ("testExample299", testExample299),
        ("testExample300", testExample300),
        ("testExample301", testExample301),
        ("testExample302", testExample302),
        ("testExample303", testExample303),
        ("testExample304", testExample304),
        ("testExample305", testExample305),
        ("testExample306", testExample306),
        ("testExample307", testExample307),
        ("testExample308", testExample308),
        ("testExample309", testExample309),
        ("testExample310", testExample310),
    ]
}