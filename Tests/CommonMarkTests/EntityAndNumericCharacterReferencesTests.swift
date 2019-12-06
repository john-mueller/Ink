import XCTest
import Ink

final class EntityAndNumericCharacterReferencesTests: XCTestCase {

    func testExample311() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &nbsp; &amp; &copy; &AElig; &Dcaron;
        &frac34; &HilbertSpace; &DifferentialD;
        &ClockwiseContourIntegral; &ngE;
        """####

        let commonmarkHtml = ####"""
        <p>  &amp; © Æ Ď
        ¾ ℋ ⅆ
        ∲ ≧̸</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample312() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &#35; &#1234; &#992; &#0;
        """####

        let commonmarkHtml = ####"""
        <p># Ӓ Ϡ �</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample313() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &#X22; &#XD06; &#xcab;
        """####

        let commonmarkHtml = ####"""
        <p>&quot; ആ ಫ</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample314() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &nbsp &x; &#; &#x;
        &#987654321;
        &#abcdef0;
        &ThisIsNotDefined; &hi?;
        """####

        let commonmarkHtml = ####"""
        <p>&amp;nbsp &amp;x; &amp;#; &amp;#x;
        &amp;#987654321;
        &amp;#abcdef0;
        &amp;ThisIsNotDefined; &amp;hi?;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample315() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &copy
        """####

        let commonmarkHtml = ####"""
        <p>&amp;copy</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample316() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &MadeUpEntity;
        """####

        let commonmarkHtml = ####"""
        <p>&amp;MadeUpEntity;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample317() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href="&ouml;&ouml;.html">
        """####

        let commonmarkHtml = ####"""
        <a href="&ouml;&ouml;.html">
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample318() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo](/f&ouml;&ouml; "f&ouml;&ouml;")
        """####

        let commonmarkHtml = ####"""
        <p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample319() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]
        
        [foo]: /f&ouml;&ouml; "f&ouml;&ouml;"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample320() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ``` f&ouml;&ouml;
        foo
        ```
        """####

        let commonmarkHtml = ####"""
        <pre><code class="language-föö">foo
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample321() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `f&ouml;&ouml;`
        """####

        let commonmarkHtml = ####"""
        <p><code>f&amp;ouml;&amp;ouml;</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample322() {
        let parser = MarkdownParser()

        let markdown = ####"""
            f&ouml;f&ouml;
        """####

        let commonmarkHtml = ####"""
        <pre><code>f&amp;ouml;f&amp;ouml;
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample323() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &#42;foo&#42;
        *foo*
        """####

        let commonmarkHtml = ####"""
        <p>*foo*
        <em>foo</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample324() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &#42; foo
        
        * foo
        """####

        let commonmarkHtml = ####"""
        <p>* foo</p>
        <ul>
        <li>foo</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample325() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo&#10;&#10;bar
        """####

        let commonmarkHtml = ####"""
        <p>foo
        
        bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample326() {
        let parser = MarkdownParser()

        let markdown = ####"""
        &#9;foo
        """####

        let commonmarkHtml = ####"""
        <p>	foo</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample327() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [a](url &quot;tit&quot;)
        """####

        let commonmarkHtml = ####"""
        <p>[a](url &quot;tit&quot;)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension EntityAndNumericCharacterReferencesTests {
    static var allTests = [
        ("testExample311", testExample311),
        ("testExample312", testExample312),
        ("testExample313", testExample313),
        ("testExample314", testExample314),
        ("testExample315", testExample315),
        ("testExample316", testExample316),
        ("testExample317", testExample317),
        ("testExample318", testExample318),
        ("testExample319", testExample319),
        ("testExample320", testExample320),
        ("testExample321", testExample321),
        ("testExample322", testExample322),
        ("testExample323", testExample323),
        ("testExample324", testExample324),
        ("testExample325", testExample325),
        ("testExample326", testExample326),
        ("testExample327", testExample327),
    ]
}