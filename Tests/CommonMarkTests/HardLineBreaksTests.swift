import XCTest
import Ink

final class HardLineBreaksTests: XCTestCase {

    func testExample630() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo  
        baz
        """####

        let commonmarkHtml = ####"""
        <p>foo<br />
        baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample631() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo\
        baz
        """####

        let commonmarkHtml = ####"""
        <p>foo<br />
        baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample632() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo       
        baz
        """####

        let commonmarkHtml = ####"""
        <p>foo<br />
        baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample633() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo  
             bar
        """####

        let commonmarkHtml = ####"""
        <p>foo<br />
        bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample634() {
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

    func testExample635() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo  
        bar*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo<br />
        bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample636() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo\
        bar*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo<br />
        bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample637() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `code 
        span`
        """####

        let commonmarkHtml = ####"""
        <p><code>code  span</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample638() {
        let parser = MarkdownParser()

        let markdown = ####"""
        `code\
        span`
        """####

        let commonmarkHtml = ####"""
        <p><code>code\ span</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample639() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href="foo  
        bar">
        """####

        let commonmarkHtml = ####"""
        <p><a href="foo  
        bar"></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample640() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href="foo\
        bar">
        """####

        let commonmarkHtml = ####"""
        <p><a href="foo\
        bar"></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample641() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo\
        """####

        let commonmarkHtml = ####"""
        <p>foo\</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample642() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo  
        """####

        let commonmarkHtml = ####"""
        <p>foo</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample643() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ### foo\
        """####

        let commonmarkHtml = ####"""
        <h3>foo\</h3>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample644() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ### foo  
        """####

        let commonmarkHtml = ####"""
        <h3>foo</h3>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension HardLineBreaksTests {
    static var allTests = [
        ("testExample630", testExample630),
        ("testExample631", testExample631),
        ("testExample632", testExample632),
        ("testExample633", testExample633),
        ("testExample634", testExample634),
        ("testExample635", testExample635),
        ("testExample636", testExample636),
        ("testExample637", testExample637),
        ("testExample638", testExample638),
        ("testExample639", testExample639),
        ("testExample640", testExample640),
        ("testExample641", testExample641),
        ("testExample642", testExample642),
        ("testExample643", testExample643),
        ("testExample644", testExample644),
    ]
}