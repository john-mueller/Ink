import XCTest
import Ink

final class ATXHeadingsTests: XCTestCase {

    func testExample32() {
        let parser = MarkdownParser()

        let markdown = ####"""
        # foo
        ## foo
        ### foo
        #### foo
        ##### foo
        ###### foo
        """####

        let commonmarkHtml = ####"""
        <h1>foo</h1>
        <h2>foo</h2>
        <h3>foo</h3>
        <h4>foo</h4>
        <h5>foo</h5>
        <h6>foo</h6>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample33() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ####### foo
        """####

        let commonmarkHtml = ####"""
        <p>####### foo</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample34() {
        let parser = MarkdownParser()

        let markdown = ####"""
        #5 bolt
        
        #hashtag
        """####

        let commonmarkHtml = ####"""
        <p>#5 bolt</p>
        <p>#hashtag</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample35() {
        let parser = MarkdownParser()

        let markdown = ####"""
        \## foo
        """####

        let commonmarkHtml = ####"""
        <p>## foo</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample36() {
        let parser = MarkdownParser()

        let markdown = ####"""
        # foo *bar* \*baz\*
        """####

        let commonmarkHtml = ####"""
        <h1>foo <em>bar</em> *baz*</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample37() {
        let parser = MarkdownParser()

        let markdown = ####"""
        #                  foo                     
        """####

        let commonmarkHtml = ####"""
        <h1>foo</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample38() {
        let parser = MarkdownParser()

        let markdown = ####"""
         ### foo
          ## foo
           # foo
        """####

        let commonmarkHtml = ####"""
        <h3>foo</h3>
        <h2>foo</h2>
        <h1>foo</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample39() {
        let parser = MarkdownParser()

        let markdown = ####"""
            # foo
        """####

        let commonmarkHtml = ####"""
        <pre><code># foo
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample40() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo
            # bar
        """####

        let commonmarkHtml = ####"""
        <p>foo
        # bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample41() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ## foo ##
          ###   bar    ###
        """####

        let commonmarkHtml = ####"""
        <h2>foo</h2>
        <h3>bar</h3>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample42() {
        let parser = MarkdownParser()

        let markdown = ####"""
        # foo ##################################
        ##### foo ##
        """####

        let commonmarkHtml = ####"""
        <h1>foo</h1>
        <h5>foo</h5>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample43() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ### foo ###     
        """####

        let commonmarkHtml = ####"""
        <h3>foo</h3>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample44() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ### foo ### b
        """####

        let commonmarkHtml = ####"""
        <h3>foo ### b</h3>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample45() {
        let parser = MarkdownParser()

        let markdown = ####"""
        # foo#
        """####

        let commonmarkHtml = ####"""
        <h1>foo#</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample46() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ### foo \###
        ## foo #\##
        # foo \#
        """####

        let commonmarkHtml = ####"""
        <h3>foo ###</h3>
        <h2>foo ###</h2>
        <h1>foo #</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample47() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ****
        ## foo
        ****
        """####

        let commonmarkHtml = ####"""
        <hr />
        <h2>foo</h2>
        <hr />
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample48() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo bar
        # baz
        Bar foo
        """####

        let commonmarkHtml = ####"""
        <p>Foo bar</p>
        <h1>baz</h1>
        <p>Bar foo</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample49() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ## 
        #
        ### ###
        """####

        let commonmarkHtml = ####"""
        <h2></h2>
        <h1></h1>
        <h3></h3>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension ATXHeadingsTests {
    static var allTests = [
        ("testExample32", testExample32),
        ("testExample33", testExample33),
        ("testExample34", testExample34),
        ("testExample35", testExample35),
        ("testExample36", testExample36),
        ("testExample37", testExample37),
        ("testExample38", testExample38),
        ("testExample39", testExample39),
        ("testExample40", testExample40),
        ("testExample41", testExample41),
        ("testExample42", testExample42),
        ("testExample43", testExample43),
        ("testExample44", testExample44),
        ("testExample45", testExample45),
        ("testExample46", testExample46),
        ("testExample47", testExample47),
        ("testExample48", testExample48),
        ("testExample49", testExample49),
    ]
}