import XCTest
import Ink

final class ImagesTests: XCTestCase {

    func testExample568() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo](/url "title")
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="foo" title="title" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample569() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo *bar*]
        
        [foo *bar*]: train.jpg "train & tracks"
        """####

        let commonmarkHtml = ####"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample570() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo ![bar](/url)](/url2)
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url2" alt="foo bar" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample571() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo [bar](/url)](/url2)
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url2" alt="foo bar" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample572() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo *bar*][]
        
        [foo *bar*]: train.jpg "train & tracks"
        """####

        let commonmarkHtml = ####"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample573() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo *bar*][foobar]
        
        [FOOBAR]: train.jpg "train & tracks"
        """####

        let commonmarkHtml = ####"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample574() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo](train.jpg)
        """####

        let commonmarkHtml = ####"""
        <p><img src="train.jpg" alt="foo" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample575() {
        let parser = MarkdownParser()

        let markdown = ####"""
        My ![foo bar](/path/to/train.jpg  "title"   )
        """####

        let commonmarkHtml = ####"""
        <p>My <img src="/path/to/train.jpg" alt="foo bar" title="title" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample576() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo](<url>)
        """####

        let commonmarkHtml = ####"""
        <p><img src="url" alt="foo" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample577() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![](/url)
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample578() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo][bar]
        
        [bar]: /url
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="foo" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample579() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo][bar]
        
        [BAR]: /url
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="foo" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample580() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo][]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="foo" title="title" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample581() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![*foo* bar][]
        
        [*foo* bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="foo bar" title="title" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample582() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![Foo][]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="Foo" title="title" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample583() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo] 
        []
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="foo" title="title" />
        []</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample584() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![foo]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="foo" title="title" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample585() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![*foo* bar]
        
        [*foo* bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="foo bar" title="title" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample586() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![[foo]]
        
        [[foo]]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p>![[foo]]</p>
        <p>[[foo]]: /url &quot;title&quot;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample587() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![Foo]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><img src="/url" alt="Foo" title="title" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample588() {
        let parser = MarkdownParser()

        let markdown = ####"""
        !\[foo]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p>![foo]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample589() {
        let parser = MarkdownParser()

        let markdown = ####"""
        \![foo]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p>!<a href="/url" title="title">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension ImagesTests {
    static var allTests = [
        ("testExample568", testExample568),
        ("testExample569", testExample569),
        ("testExample570", testExample570),
        ("testExample571", testExample571),
        ("testExample572", testExample572),
        ("testExample573", testExample573),
        ("testExample574", testExample574),
        ("testExample575", testExample575),
        ("testExample576", testExample576),
        ("testExample577", testExample577),
        ("testExample578", testExample578),
        ("testExample579", testExample579),
        ("testExample580", testExample580),
        ("testExample581", testExample581),
        ("testExample582", testExample582),
        ("testExample583", testExample583),
        ("testExample584", testExample584),
        ("testExample585", testExample585),
        ("testExample586", testExample586),
        ("testExample587", testExample587),
        ("testExample588", testExample588),
        ("testExample589", testExample589),
    ]
}