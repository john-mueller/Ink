import XCTest
import Ink

final class RawHTMLTests: XCTestCase {

    func testExample609() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a><bab><c2c>
        """####

        let commonmarkHtml = ####"""
        <p><a><bab><c2c></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample610() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a/><b2/>
        """####

        let commonmarkHtml = ####"""
        <p><a/><b2/></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample611() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a  /><b2
        data="foo" >
        """####

        let commonmarkHtml = ####"""
        <p><a  /><b2
        data="foo" ></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample612() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a foo="bar" bam = 'baz <em>"</em>'
        _boolean zoop:33=zoop:33 />
        """####

        let commonmarkHtml = ####"""
        <p><a foo="bar" bam = 'baz <em>"</em>'
        _boolean zoop:33=zoop:33 /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample613() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo <responsive-image src="foo.jpg" />
        """####

        let commonmarkHtml = ####"""
        <p>Foo <responsive-image src="foo.jpg" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample614() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <33> <__>
        """####

        let commonmarkHtml = ####"""
        <p>&lt;33&gt; &lt;__&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample615() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a h*#ref="hi">
        """####

        let commonmarkHtml = ####"""
        <p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample616() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href="hi'> <a href=hi'>
        """####

        let commonmarkHtml = ####"""
        <p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample617() {
        let parser = MarkdownParser()

        let markdown = ####"""
        < a><
        foo><bar/ >
        <foo bar=baz
        bim!bop />
        """####

        let commonmarkHtml = ####"""
        <p>&lt; a&gt;&lt;
        foo&gt;&lt;bar/ &gt;
        &lt;foo bar=baz
        bim!bop /&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample618() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href='bar'title=title>
        """####

        let commonmarkHtml = ####"""
        <p>&lt;a href='bar'title=title&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample619() {
        let parser = MarkdownParser()

        let markdown = ####"""
        </a></foo >
        """####

        let commonmarkHtml = ####"""
        <p></a></foo ></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample620() {
        let parser = MarkdownParser()

        let markdown = ####"""
        </a href="foo">
        """####

        let commonmarkHtml = ####"""
        <p>&lt;/a href=&quot;foo&quot;&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample621() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo <!-- this is a
        comment - with hyphen -->
        """####

        let commonmarkHtml = ####"""
        <p>foo <!-- this is a
        comment - with hyphen --></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample622() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo <!-- not a comment -- two hyphens -->
        """####

        let commonmarkHtml = ####"""
        <p>foo &lt;!-- not a comment -- two hyphens --&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample623() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo <!--> foo -->
        
        foo <!-- foo--->
        """####

        let commonmarkHtml = ####"""
        <p>foo &lt;!--&gt; foo --&gt;</p>
        <p>foo &lt;!-- foo---&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample624() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo <?php echo $a; ?>
        """####

        let commonmarkHtml = ####"""
        <p>foo <?php echo $a; ?></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample625() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo <!ELEMENT br EMPTY>
        """####

        let commonmarkHtml = ####"""
        <p>foo <!ELEMENT br EMPTY></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample626() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo <![CDATA[>&<]]>
        """####

        let commonmarkHtml = ####"""
        <p>foo <![CDATA[>&<]]></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample627() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo <a href="&ouml;">
        """####

        let commonmarkHtml = ####"""
        <p>foo <a href="&ouml;"></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample628() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo <a href="\*">
        """####

        let commonmarkHtml = ####"""
        <p>foo <a href="\*"></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample629() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href="\"">
        """####

        let commonmarkHtml = ####"""
        <p>&lt;a href=&quot;&quot;&quot;&gt;</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension RawHTMLTests {
    static var allTests = [
        ("testExample609", testExample609),
        ("testExample610", testExample610),
        ("testExample611", testExample611),
        ("testExample612", testExample612),
        ("testExample613", testExample613),
        ("testExample614", testExample614),
        ("testExample615", testExample615),
        ("testExample616", testExample616),
        ("testExample617", testExample617),
        ("testExample618", testExample618),
        ("testExample619", testExample619),
        ("testExample620", testExample620),
        ("testExample621", testExample621),
        ("testExample622", testExample622),
        ("testExample623", testExample623),
        ("testExample624", testExample624),
        ("testExample625", testExample625),
        ("testExample626", testExample626),
        ("testExample627", testExample627),
        ("testExample628", testExample628),
        ("testExample629", testExample629),
    ]
}