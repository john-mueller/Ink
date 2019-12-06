import XCTest
import Ink

final class LinksTests: XCTestCase {

    func testExample481() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](/uri "title")
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri" title="title">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample482() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](/uri)
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample483() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link]()
        """####

        let commonmarkHtml = ####"""
        <p><a href="">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample484() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](<>)
        """####

        let commonmarkHtml = ####"""
        <p><a href="">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample485() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](/my uri)
        """####

        let commonmarkHtml = ####"""
        <p>[link](/my uri)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample486() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](</my uri>)
        """####

        let commonmarkHtml = ####"""
        <p><a href="/my%20uri">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample487() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](foo
        bar)
        """####

        let commonmarkHtml = ####"""
        <p>[link](foo
        bar)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample488() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](<foo
        bar>)
        """####

        let commonmarkHtml = ####"""
        <p>[link](<foo
        bar>)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample489() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [a](<b)c>)
        """####

        let commonmarkHtml = ####"""
        <p><a href="b)c">a</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample490() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](<foo\>)
        """####

        let commonmarkHtml = ####"""
        <p>[link](&lt;foo&gt;)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample491() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [a](<b)c
        [a](<b)c>
        [a](<b>c)
        """####

        let commonmarkHtml = ####"""
        <p>[a](&lt;b)c
        [a](&lt;b)c&gt;
        [a](<b>c)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample492() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](\(foo\))
        """####

        let commonmarkHtml = ####"""
        <p><a href="(foo)">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample493() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](foo(and(bar)))
        """####

        let commonmarkHtml = ####"""
        <p><a href="foo(and(bar))">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample494() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](foo\(and\(bar\))
        """####

        let commonmarkHtml = ####"""
        <p><a href="foo(and(bar)">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample495() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](<foo(and(bar)>)
        """####

        let commonmarkHtml = ####"""
        <p><a href="foo(and(bar)">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample496() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](foo\)\:)
        """####

        let commonmarkHtml = ####"""
        <p><a href="foo):">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample497() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](#fragment)
        
        [link](http://example.com#fragment)
        
        [link](http://example.com?foo=3#frag)
        """####

        let commonmarkHtml = ####"""
        <p><a href="#fragment">link</a></p>
        <p><a href="http://example.com#fragment">link</a></p>
        <p><a href="http://example.com?foo=3#frag">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample498() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](foo\bar)
        """####

        let commonmarkHtml = ####"""
        <p><a href="foo%5Cbar">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample499() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](foo%20b&auml;)
        """####

        let commonmarkHtml = ####"""
        <p><a href="foo%20b%C3%A4">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample500() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link]("title")
        """####

        let commonmarkHtml = ####"""
        <p><a href="%22title%22">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample501() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](/url "title")
        [link](/url 'title')
        [link](/url (title))
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">link</a>
        <a href="/url" title="title">link</a>
        <a href="/url" title="title">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample502() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](/url "title \"&quot;")
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title &quot;&quot;">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample503() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](/url "title")
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url%C2%A0%22title%22">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample504() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](/url "title "and" title")
        """####

        let commonmarkHtml = ####"""
        <p>[link](/url &quot;title &quot;and&quot; title&quot;)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample505() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](/url 'title "and" title')
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title &quot;and&quot; title">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample506() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link](   /uri
          "title"  )
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri" title="title">link</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample507() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link] (/uri)
        """####

        let commonmarkHtml = ####"""
        <p>[link] (/uri)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample508() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link [foo [bar]]](/uri)
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">link [foo [bar]]</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample509() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link] bar](/uri)
        """####

        let commonmarkHtml = ####"""
        <p>[link] bar](/uri)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample510() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link [bar](/uri)
        """####

        let commonmarkHtml = ####"""
        <p>[link <a href="/uri">bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample511() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link \[bar](/uri)
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">link [bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample512() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link *foo **bar** `#`*](/uri)
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample513() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [![moon](moon.jpg)](/uri)
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample514() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo [bar](/uri)](/uri)
        """####

        let commonmarkHtml = ####"""
        <p>[foo <a href="/uri">bar</a>](/uri)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample515() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo *[bar [baz](/uri)](/uri)*](/uri)
        """####

        let commonmarkHtml = ####"""
        <p>[foo <em>[bar <a href="/uri">baz</a>](/uri)</em>](/uri)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample516() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ![[[foo](uri1)](uri2)](uri3)
        """####

        let commonmarkHtml = ####"""
        <p><img src="uri3" alt="[foo](uri2)" /></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample517() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *[foo*](/uri)
        """####

        let commonmarkHtml = ####"""
        <p>*<a href="/uri">foo*</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample518() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo *bar](baz*)
        """####

        let commonmarkHtml = ####"""
        <p><a href="baz*">foo *bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample519() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo [bar* baz]
        """####

        let commonmarkHtml = ####"""
        <p><em>foo [bar</em> baz]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample520() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo <bar attr="](baz)">
        """####

        let commonmarkHtml = ####"""
        <p>[foo <bar attr="](baz)"></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample521() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo`](/uri)`
        """####

        let commonmarkHtml = ####"""
        <p>[foo<code>](/uri)</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample522() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo<http://example.com/?search=](uri)>
        """####

        let commonmarkHtml = ####"""
        <p>[foo<a href="http://example.com/?search=%5D(uri)">http://example.com/?search=](uri)</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample523() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][bar]
        
        [bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample524() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link [foo [bar]]][ref]
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">link [foo [bar]]</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample525() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link \[bar][ref]
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">link [bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample526() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [link *foo **bar** `#`*][ref]
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample527() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [![moon](moon.jpg)][ref]
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample528() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo [bar](/uri)][ref]
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[foo <a href="/uri">bar</a>]<a href="/uri">ref</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample529() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo *bar [baz][ref]*][ref]
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[foo <em>bar <a href="/uri">baz</a></em>]<a href="/uri">ref</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample530() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *[foo*][ref]
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>*<a href="/uri">foo*</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample531() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo *bar][ref]
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">foo *bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample532() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo <bar attr="][ref]">
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[foo <bar attr="][ref]"></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample533() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo`][ref]`
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[foo<code>][ref]</code></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample534() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo<http://example.com/?search=][ref]>
        
        [ref]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[foo<a href="http://example.com/?search=%5D%5Bref%5D">http://example.com/?search=][ref]</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample535() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][BaR]
        
        [bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample536() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [Толпой][Толпой] is a Russian word.
        
        [ТОЛПОЙ]: /url
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url">Толпой</a> is a Russian word.</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample537() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [Foo
          bar]: /url
        
        [Baz][Foo bar]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url">Baz</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample538() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo] [bar]
        
        [bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p>[foo] <a href="/url" title="title">bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample539() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]
        [bar]
        
        [bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p>[foo]
        <a href="/url" title="title">bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample540() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]: /url1
        
        [foo]: /url2
        
        [bar][foo]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url1">bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample541() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [bar][foo\!]
        
        [foo!]: /url
        """####

        let commonmarkHtml = ####"""
        <p>[bar][foo!]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample542() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][ref[]
        
        [ref[]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[foo][ref[]</p>
        <p>[ref[]: /uri</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample543() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][ref[bar]]
        
        [ref[bar]]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[foo][ref[bar]]</p>
        <p>[ref[bar]]: /uri</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample544() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [[[foo]]]
        
        [[[foo]]]: /url
        """####

        let commonmarkHtml = ####"""
        <p>[[[foo]]]</p>
        <p>[[[foo]]]: /url</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample545() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][ref\[]
        
        [ref\[]: /uri
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample546() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [bar\\]: /uri
        
        [bar\\]
        """####

        let commonmarkHtml = ####"""
        <p><a href="/uri">bar\</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample547() {
        let parser = MarkdownParser()

        let markdown = ####"""
        []
        
        []: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[]</p>
        <p>[]: /uri</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample548() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [
         ]
        
        [
         ]: /uri
        """####

        let commonmarkHtml = ####"""
        <p>[
        ]</p>
        <p>[
        ]: /uri</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample549() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample550() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [*foo* bar][]
        
        [*foo* bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title"><em>foo</em> bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample551() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [Foo][]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">Foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample552() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo] 
        []
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">foo</a>
        []</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample553() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample554() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [*foo* bar]
        
        [*foo* bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title"><em>foo</em> bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample555() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [[*foo* bar]]
        
        [*foo* bar]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p>[<a href="/url" title="title"><em>foo</em> bar</a>]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample556() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [[bar [foo]
        
        [foo]: /url
        """####

        let commonmarkHtml = ####"""
        <p>[[bar <a href="/url">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample557() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [Foo]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url" title="title">Foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample558() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo] bar
        
        [foo]: /url
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url">foo</a> bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample559() {
        let parser = MarkdownParser()

        let markdown = ####"""
        \[foo]
        
        [foo]: /url "title"
        """####

        let commonmarkHtml = ####"""
        <p>[foo]</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample560() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo*]: /url
        
        *[foo*]
        """####

        let commonmarkHtml = ####"""
        <p>*<a href="/url">foo*</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample561() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][bar]
        
        [foo]: /url1
        [bar]: /url2
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url2">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample562() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][]
        
        [foo]: /url1
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url1">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample563() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo]()
        
        [foo]: /url1
        """####

        let commonmarkHtml = ####"""
        <p><a href="">foo</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample564() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo](not a link)
        
        [foo]: /url1
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url1">foo</a>(not a link)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample565() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][bar][baz]
        
        [baz]: /url
        """####

        let commonmarkHtml = ####"""
        <p>[foo]<a href="/url">bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample566() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][bar][baz]
        
        [baz]: /url1
        [bar]: /url2
        """####

        let commonmarkHtml = ####"""
        <p><a href="/url2">foo</a><a href="/url1">baz</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample567() {
        let parser = MarkdownParser()

        let markdown = ####"""
        [foo][bar][baz]
        
        [baz]: /url1
        [foo]: /url2
        """####

        let commonmarkHtml = ####"""
        <p>[foo]<a href="/url1">bar</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension LinksTests {
    static var allTests = [
        ("testExample481", testExample481),
        ("testExample482", testExample482),
        ("testExample483", testExample483),
        ("testExample484", testExample484),
        ("testExample485", testExample485),
        ("testExample486", testExample486),
        ("testExample487", testExample487),
        ("testExample488", testExample488),
        ("testExample489", testExample489),
        ("testExample490", testExample490),
        ("testExample491", testExample491),
        ("testExample492", testExample492),
        ("testExample493", testExample493),
        ("testExample494", testExample494),
        ("testExample495", testExample495),
        ("testExample496", testExample496),
        ("testExample497", testExample497),
        ("testExample498", testExample498),
        ("testExample499", testExample499),
        ("testExample500", testExample500),
        ("testExample501", testExample501),
        ("testExample502", testExample502),
        ("testExample503", testExample503),
        ("testExample504", testExample504),
        ("testExample505", testExample505),
        ("testExample506", testExample506),
        ("testExample507", testExample507),
        ("testExample508", testExample508),
        ("testExample509", testExample509),
        ("testExample510", testExample510),
        ("testExample511", testExample511),
        ("testExample512", testExample512),
        ("testExample513", testExample513),
        ("testExample514", testExample514),
        ("testExample515", testExample515),
        ("testExample516", testExample516),
        ("testExample517", testExample517),
        ("testExample518", testExample518),
        ("testExample519", testExample519),
        ("testExample520", testExample520),
        ("testExample521", testExample521),
        ("testExample522", testExample522),
        ("testExample523", testExample523),
        ("testExample524", testExample524),
        ("testExample525", testExample525),
        ("testExample526", testExample526),
        ("testExample527", testExample527),
        ("testExample528", testExample528),
        ("testExample529", testExample529),
        ("testExample530", testExample530),
        ("testExample531", testExample531),
        ("testExample532", testExample532),
        ("testExample533", testExample533),
        ("testExample534", testExample534),
        ("testExample535", testExample535),
        ("testExample536", testExample536),
        ("testExample537", testExample537),
        ("testExample538", testExample538),
        ("testExample539", testExample539),
        ("testExample540", testExample540),
        ("testExample541", testExample541),
        ("testExample542", testExample542),
        ("testExample543", testExample543),
        ("testExample544", testExample544),
        ("testExample545", testExample545),
        ("testExample546", testExample546),
        ("testExample547", testExample547),
        ("testExample548", testExample548),
        ("testExample549", testExample549),
        ("testExample550", testExample550),
        ("testExample551", testExample551),
        ("testExample552", testExample552),
        ("testExample553", testExample553),
        ("testExample554", testExample554),
        ("testExample555", testExample555),
        ("testExample556", testExample556),
        ("testExample557", testExample557),
        ("testExample558", testExample558),
        ("testExample559", testExample559),
        ("testExample560", testExample560),
        ("testExample561", testExample561),
        ("testExample562", testExample562),
        ("testExample563", testExample563),
        ("testExample564", testExample564),
        ("testExample565", testExample565),
        ("testExample566", testExample566),
        ("testExample567", testExample567),
    ]
}