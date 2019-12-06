import XCTest
import Ink

final class AutolinksTests: XCTestCase {

    func testExample590() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <http://foo.bar.baz>
        """####

        let commonmarkHtml = ####"""
        <p><a href="http://foo.bar.baz">http://foo.bar.baz</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample591() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <http://foo.bar.baz/test?q=hello&id=22&boolean>
        """####

        let commonmarkHtml = ####"""
        <p><a href="http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean">http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample592() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <irc://foo.bar:2233/baz>
        """####

        let commonmarkHtml = ####"""
        <p><a href="irc://foo.bar:2233/baz">irc://foo.bar:2233/baz</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample593() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <MAILTO:FOO@BAR.BAZ>
        """####

        let commonmarkHtml = ####"""
        <p><a href="MAILTO:FOO@BAR.BAZ">MAILTO:FOO@BAR.BAZ</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample594() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a+b+c:d>
        """####

        let commonmarkHtml = ####"""
        <p><a href="a+b+c:d">a+b+c:d</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample595() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <made-up-scheme://foo,bar>
        """####

        let commonmarkHtml = ####"""
        <p><a href="made-up-scheme://foo,bar">made-up-scheme://foo,bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample596() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <http://../>
        """####

        let commonmarkHtml = ####"""
        <p><a href="http://../">http://../</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample597() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <localhost:5001/foo>
        """####

        let commonmarkHtml = ####"""
        <p><a href="localhost:5001/foo">localhost:5001/foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample598() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <http://foo.bar/baz bim>
        """####

        let commonmarkHtml = ####"""
        <p>&lt;http://foo.bar/baz bim&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample599() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <http://example.com/\[\>
        """####

        let commonmarkHtml = ####"""
        <p><a href="http://example.com/%5C%5B%5C">http://example.com/\[\</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample600() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <foo@bar.example.com>
        """####

        let commonmarkHtml = ####"""
        <p><a href="mailto:foo@bar.example.com">foo@bar.example.com</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample601() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <foo+special@Bar.baz-bar0.com>
        """####

        let commonmarkHtml = ####"""
        <p><a href="mailto:foo+special@Bar.baz-bar0.com">foo+special@Bar.baz-bar0.com</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample602() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <foo\+@bar.example.com>
        """####

        let commonmarkHtml = ####"""
        <p>&lt;foo+@bar.example.com&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample603() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <>
        """####

        let commonmarkHtml = ####"""
        <p>&lt;&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample604() {
        let parser = MarkdownParser()

        let markdown = ####"""
        < http://foo.bar >
        """####

        let commonmarkHtml = ####"""
        <p>&lt; http://foo.bar &gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample605() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <m:abc>
        """####

        let commonmarkHtml = ####"""
        <p>&lt;m:abc&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample606() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <foo.bar.baz>
        """####

        let commonmarkHtml = ####"""
        <p>&lt;foo.bar.baz&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample607() {
        let parser = MarkdownParser()

        let markdown = ####"""
        http://example.com
        """####

        let commonmarkHtml = ####"""
        <p>http://example.com</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample608() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo@bar.example.com
        """####

        let commonmarkHtml = ####"""
        <p>foo@bar.example.com</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension AutolinksTests {
    static var allTests = [
        ("testExample590", testExample590),
        ("testExample591", testExample591),
        ("testExample592", testExample592),
        ("testExample593", testExample593),
        ("testExample594", testExample594),
        ("testExample595", testExample595),
        ("testExample596", testExample596),
        ("testExample597", testExample597),
        ("testExample598", testExample598),
        ("testExample599", testExample599),
        ("testExample600", testExample600),
        ("testExample601", testExample601),
        ("testExample602", testExample602),
        ("testExample603", testExample603),
        ("testExample604", testExample604),
        ("testExample605", testExample605),
        ("testExample606", testExample606),
        ("testExample607", testExample607),
        ("testExample608", testExample608),
    ]
}