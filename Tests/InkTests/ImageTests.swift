/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import XCTest
import Ink

final class ImageTests: XCTestCase {
    func testImageWithURL() {
        let html = MarkdownParser().html(from: "![](url)")
        XCTAssertEqual(html, #"<p><img src="url"/></p>"#)
    }

    func testImagesCreateParagraphs() {
        let html = MarkdownParser().html(from: "![](url)\n\n![](url)")
        XCTAssertEqual(html, #"<p><img src="url"/></p><p><img src="url"/></p>"#)
    }

    func testImageWithReference() {
        let html = MarkdownParser().html(from: """
        ![][url]

        [url]: https://swiftbysundell.com
        """)

        XCTAssertEqual(html, #"<p><img src="https://swiftbysundell.com"/></p>"#)
    }

    func testImageWithURLAndAltText() {
        let html = MarkdownParser().html(from: "![Alt text](url)")
        XCTAssertEqual(html, #"<p><img src="url" alt="Alt text"/></p>"#)
    }

    func testImageWithURLAndAltTextAndTitle() {
        let html = MarkdownParser().html(from: "![Alt text](url \"Swift by Sundell\")")
        XCTAssertEqual(html, #"<p><img src="url" alt="Alt text" title="Swift by Sundell"/></p>"#)
    }

    func testImageWithReferenceAndAltText() {
        let html = MarkdownParser().html(from: """
        ![Alt text][url]

        [url]: swiftbysundell.com
        """)

        XCTAssertEqual(html, #"<p><img src="swiftbysundell.com" alt="Alt text"/></p>"#)
    }

    func testImageWithReferenceAndMoreTextLater() {
        let html = MarkdownParser().html(from: """
        ![Alt text][url]

        More text

        [url]: swiftbysundell.com
        """)

        XCTAssertEqual(html, #"<p><img src="swiftbysundell.com" alt="Alt text"/></p><p>More text</p>"#)
    }

    func testImageWithReferenceAndAltTextAndTitle() {
        let html = MarkdownParser().html(from: """
        ![Alt text][url]

        [url]: swiftbysundell.com    'Swift by Sundell'
        """)

        XCTAssertEqual(html, #"<p><img src="swiftbysundell.com" alt="Alt text" title="Swift by Sundell"/></p>"#)
    }

    func testImageWithReferenceAndAltTextAndNewlineTitle() {
        let html = MarkdownParser().html(from: """
        ![Alt text][url]

        [url]: swiftbysundell.com
              (Swift by Sundell)
        """)

        XCTAssertEqual(html, #"<p><img src="swiftbysundell.com" alt="Alt text" title="Swift by Sundell"/></p>"#)
    }

    func testImageWithinParagraph() {
        let html = MarkdownParser().html(from: "Text ![](url) text")
        XCTAssertEqual(html, #"<p>Text <img src="url"/> text</p>"#)
    }
}

extension ImageTests {
    static var allTests: Linux.TestList<ImageTests> {
        return [
            ("testImageWithURL", testImageWithURL),
            ("testImagesCreateParagraphs", testImagesCreateParagraphs),
            ("testImageWithReference", testImageWithReference),
            ("testImageWithURLAndAltText", testImageWithURLAndAltText),
            ("testImageWithURLAndAltTextAndTitle", testImageWithURLAndAltTextAndTitle),
            ("testImageWithReferenceAndAltText", testImageWithReferenceAndAltText),
            ("testImageWithReferenceAndAltTextAndTitle", testImageWithReferenceAndAltTextAndTitle),
            ("testImageWithReferenceAndAltTextAndNewlineTitle", testImageWithReferenceAndAltTextAndNewlineTitle),
            ("testImageWithReferenceAndMoreTextLater", testImageWithReferenceAndMoreTextLater),
            ("testImageWithinParagraph", testImageWithinParagraph)
        ]
    }
}
