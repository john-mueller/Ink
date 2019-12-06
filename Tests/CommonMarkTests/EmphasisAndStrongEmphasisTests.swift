import XCTest
import Ink

final class EmphasisAndStrongEmphasisTests: XCTestCase {

    func testExample350() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo bar*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample351() {
        let parser = MarkdownParser()

        let markdown = ####"""
        a * foo bar*
        """####

        let commonmarkHtml = ####"""
        <p>a * foo bar*</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample352() {
        let parser = MarkdownParser()

        let markdown = ####"""
        a*"foo"*
        """####

        let commonmarkHtml = ####"""
        <p>a*&quot;foo&quot;*</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample353() {
        let parser = MarkdownParser()

        let markdown = ####"""
        * a *
        """####

        let commonmarkHtml = ####"""
        <p>* a *</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample354() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo*bar*
        """####

        let commonmarkHtml = ####"""
        <p>foo<em>bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample355() {
        let parser = MarkdownParser()

        let markdown = ####"""
        5*6*78
        """####

        let commonmarkHtml = ####"""
        <p>5<em>6</em>78</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample356() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo bar_
        """####

        let commonmarkHtml = ####"""
        <p><em>foo bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample357() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _ foo bar_
        """####

        let commonmarkHtml = ####"""
        <p>_ foo bar_</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample358() {
        let parser = MarkdownParser()

        let markdown = ####"""
        a_"foo"_
        """####

        let commonmarkHtml = ####"""
        <p>a_&quot;foo&quot;_</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample359() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo_bar_
        """####

        let commonmarkHtml = ####"""
        <p>foo_bar_</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample360() {
        let parser = MarkdownParser()

        let markdown = ####"""
        5_6_78
        """####

        let commonmarkHtml = ####"""
        <p>5_6_78</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample361() {
        let parser = MarkdownParser()

        let markdown = ####"""
        пристаням_стремятся_
        """####

        let commonmarkHtml = ####"""
        <p>пристаням_стремятся_</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample362() {
        let parser = MarkdownParser()

        let markdown = ####"""
        aa_"bb"_cc
        """####

        let commonmarkHtml = ####"""
        <p>aa_&quot;bb&quot;_cc</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample363() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo-_(bar)_
        """####

        let commonmarkHtml = ####"""
        <p>foo-<em>(bar)</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample364() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo*
        """####

        let commonmarkHtml = ####"""
        <p>_foo*</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample365() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo bar *
        """####

        let commonmarkHtml = ####"""
        <p>*foo bar *</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample366() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo bar
        *
        """####

        let commonmarkHtml = ####"""
        <p>*foo bar
        *</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample367() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *(*foo)
        """####

        let commonmarkHtml = ####"""
        <p>*(*foo)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample368() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *(*foo*)*
        """####

        let commonmarkHtml = ####"""
        <p><em>(<em>foo</em>)</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample369() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo*bar
        """####

        let commonmarkHtml = ####"""
        <p><em>foo</em>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample370() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo bar _
        """####

        let commonmarkHtml = ####"""
        <p>_foo bar _</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample371() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _(_foo)
        """####

        let commonmarkHtml = ####"""
        <p>_(_foo)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample372() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _(_foo_)_
        """####

        let commonmarkHtml = ####"""
        <p><em>(<em>foo</em>)</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample373() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo_bar
        """####

        let commonmarkHtml = ####"""
        <p>_foo_bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample374() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _пристаням_стремятся
        """####

        let commonmarkHtml = ####"""
        <p>_пристаням_стремятся</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample375() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo_bar_baz_
        """####

        let commonmarkHtml = ####"""
        <p><em>foo_bar_baz</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample376() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _(bar)_.
        """####

        let commonmarkHtml = ####"""
        <p><em>(bar)</em>.</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample377() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo bar**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo bar</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample378() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ** foo bar**
        """####

        let commonmarkHtml = ####"""
        <p>** foo bar**</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample379() {
        let parser = MarkdownParser()

        let markdown = ####"""
        a**"foo"**
        """####

        let commonmarkHtml = ####"""
        <p>a**&quot;foo&quot;**</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample380() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo**bar**
        """####

        let commonmarkHtml = ####"""
        <p>foo<strong>bar</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample381() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo bar__
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo bar</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample382() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __ foo bar__
        """####

        let commonmarkHtml = ####"""
        <p>__ foo bar__</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample383() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __
        foo bar__
        """####

        let commonmarkHtml = ####"""
        <p>__
        foo bar__</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample384() {
        let parser = MarkdownParser()

        let markdown = ####"""
        a__"foo"__
        """####

        let commonmarkHtml = ####"""
        <p>a__&quot;foo&quot;__</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample385() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo__bar__
        """####

        let commonmarkHtml = ####"""
        <p>foo__bar__</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample386() {
        let parser = MarkdownParser()

        let markdown = ####"""
        5__6__78
        """####

        let commonmarkHtml = ####"""
        <p>5__6__78</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample387() {
        let parser = MarkdownParser()

        let markdown = ####"""
        пристаням__стремятся__
        """####

        let commonmarkHtml = ####"""
        <p>пристаням__стремятся__</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample388() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo, __bar__, baz__
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo, <strong>bar</strong>, baz</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample389() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo-__(bar)__
        """####

        let commonmarkHtml = ####"""
        <p>foo-<strong>(bar)</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample390() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo bar **
        """####

        let commonmarkHtml = ####"""
        <p>**foo bar **</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample391() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **(**foo)
        """####

        let commonmarkHtml = ####"""
        <p>**(**foo)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample392() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *(**foo**)*
        """####

        let commonmarkHtml = ####"""
        <p><em>(<strong>foo</strong>)</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample393() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **Gomphocarpus (*Gomphocarpus physocarpus*, syn.
        *Asclepias physocarpa*)**
        """####

        let commonmarkHtml = ####"""
        <p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.
        <em>Asclepias physocarpa</em>)</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample394() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo "*bar*" foo**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo &quot;<em>bar</em>&quot; foo</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample395() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo**bar
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo</strong>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample396() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo bar __
        """####

        let commonmarkHtml = ####"""
        <p>__foo bar __</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample397() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __(__foo)
        """####

        let commonmarkHtml = ####"""
        <p>__(__foo)</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample398() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _(__foo__)_
        """####

        let commonmarkHtml = ####"""
        <p><em>(<strong>foo</strong>)</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample399() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo__bar
        """####

        let commonmarkHtml = ####"""
        <p>__foo__bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample400() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __пристаням__стремятся
        """####

        let commonmarkHtml = ####"""
        <p>__пристаням__стремятся</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample401() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo__bar__baz__
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo__bar__baz</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample402() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __(bar)__.
        """####

        let commonmarkHtml = ####"""
        <p><strong>(bar)</strong>.</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample403() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo [bar](/url)*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <a href="/url">bar</a></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample404() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo
        bar*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo
        bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample405() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo __bar__ baz_
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <strong>bar</strong> baz</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample406() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo _bar_ baz_
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <em>bar</em> baz</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample407() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo_ bar_
        """####

        let commonmarkHtml = ####"""
        <p><em><em>foo</em> bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample408() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo *bar**
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <em>bar</em></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample409() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo **bar** baz*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <strong>bar</strong> baz</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample410() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo**bar**baz*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo<strong>bar</strong>baz</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample411() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo**bar*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo**bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample412() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ***foo** bar*
        """####

        let commonmarkHtml = ####"""
        <p><em><strong>foo</strong> bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample413() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo **bar***
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <strong>bar</strong></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample414() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo**bar***
        """####

        let commonmarkHtml = ####"""
        <p><em>foo<strong>bar</strong></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample415() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo***bar***baz
        """####

        let commonmarkHtml = ####"""
        <p>foo<em><strong>bar</strong></em>baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample416() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo******bar*********baz
        """####

        let commonmarkHtml = ####"""
        <p>foo<strong><strong><strong>bar</strong></strong></strong>***baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample417() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo **bar *baz* bim** bop*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <strong>bar <em>baz</em> bim</strong> bop</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample418() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo [*bar*](/url)*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <a href="/url"><em>bar</em></a></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample419() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ** is not an empty emphasis
        """####

        let commonmarkHtml = ####"""
        <p>** is not an empty emphasis</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample420() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **** is not an empty strong emphasis
        """####

        let commonmarkHtml = ####"""
        <p>**** is not an empty strong emphasis</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample421() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo [bar](/url)**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo <a href="/url">bar</a></strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample422() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo
        bar**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo
        bar</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample423() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo _bar_ baz__
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo <em>bar</em> baz</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample424() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo __bar__ baz__
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo <strong>bar</strong> baz</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample425() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ____foo__ bar__
        """####

        let commonmarkHtml = ####"""
        <p><strong><strong>foo</strong> bar</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample426() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo **bar****
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo <strong>bar</strong></strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample427() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo *bar* baz**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo <em>bar</em> baz</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample428() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo*bar*baz**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo<em>bar</em>baz</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample429() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ***foo* bar**
        """####

        let commonmarkHtml = ####"""
        <p><strong><em>foo</em> bar</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample430() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo *bar***
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo <em>bar</em></strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample431() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo *bar **baz**
        bim* bop**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo <em>bar <strong>baz</strong>
        bim</em> bop</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample432() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo [*bar*](/url)**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo <a href="/url"><em>bar</em></a></strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample433() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __ is not an empty emphasis
        """####

        let commonmarkHtml = ####"""
        <p>__ is not an empty emphasis</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample434() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ____ is not an empty strong emphasis
        """####

        let commonmarkHtml = ####"""
        <p>____ is not an empty strong emphasis</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample435() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo ***
        """####

        let commonmarkHtml = ####"""
        <p>foo ***</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample436() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo *\**
        """####

        let commonmarkHtml = ####"""
        <p>foo <em>*</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample437() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo *_*
        """####

        let commonmarkHtml = ####"""
        <p>foo <em>_</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample438() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo *****
        """####

        let commonmarkHtml = ####"""
        <p>foo *****</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample439() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo **\***
        """####

        let commonmarkHtml = ####"""
        <p>foo <strong>*</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample440() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo **_**
        """####

        let commonmarkHtml = ####"""
        <p>foo <strong>_</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample441() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo*
        """####

        let commonmarkHtml = ####"""
        <p>*<em>foo</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample442() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo**
        """####

        let commonmarkHtml = ####"""
        <p><em>foo</em>*</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample443() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ***foo**
        """####

        let commonmarkHtml = ####"""
        <p>*<strong>foo</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample444() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ****foo*
        """####

        let commonmarkHtml = ####"""
        <p>***<em>foo</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample445() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo***
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo</strong>*</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample446() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo****
        """####

        let commonmarkHtml = ####"""
        <p><em>foo</em>***</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample447() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo ___
        """####

        let commonmarkHtml = ####"""
        <p>foo ___</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample448() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo _\__
        """####

        let commonmarkHtml = ####"""
        <p>foo <em>_</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample449() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo _*_
        """####

        let commonmarkHtml = ####"""
        <p>foo <em>*</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample450() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo _____
        """####

        let commonmarkHtml = ####"""
        <p>foo _____</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample451() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo __\___
        """####

        let commonmarkHtml = ####"""
        <p>foo <strong>_</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample452() {
        let parser = MarkdownParser()

        let markdown = ####"""
        foo __*__
        """####

        let commonmarkHtml = ####"""
        <p>foo <strong>*</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample453() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo_
        """####

        let commonmarkHtml = ####"""
        <p>_<em>foo</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample454() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo__
        """####

        let commonmarkHtml = ####"""
        <p><em>foo</em>_</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample455() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ___foo__
        """####

        let commonmarkHtml = ####"""
        <p>_<strong>foo</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample456() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ____foo_
        """####

        let commonmarkHtml = ####"""
        <p>___<em>foo</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample457() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo___
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo</strong>_</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample458() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo____
        """####

        let commonmarkHtml = ####"""
        <p><em>foo</em>___</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample459() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo**
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample460() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *_foo_*
        """####

        let commonmarkHtml = ####"""
        <p><em><em>foo</em></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample461() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __foo__
        """####

        let commonmarkHtml = ####"""
        <p><strong>foo</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample462() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _*foo*_
        """####

        let commonmarkHtml = ####"""
        <p><em><em>foo</em></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample463() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ****foo****
        """####

        let commonmarkHtml = ####"""
        <p><strong><strong>foo</strong></strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample464() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ____foo____
        """####

        let commonmarkHtml = ####"""
        <p><strong><strong>foo</strong></strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample465() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ******foo******
        """####

        let commonmarkHtml = ####"""
        <p><strong><strong><strong>foo</strong></strong></strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample466() {
        let parser = MarkdownParser()

        let markdown = ####"""
        ***foo***
        """####

        let commonmarkHtml = ####"""
        <p><em><strong>foo</strong></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample467() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _____foo_____
        """####

        let commonmarkHtml = ####"""
        <p><em><strong><strong>foo</strong></strong></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample468() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo _bar* baz_
        """####

        let commonmarkHtml = ####"""
        <p><em>foo _bar</em> baz_</p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample469() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo __bar *baz bim__ bam*
        """####

        let commonmarkHtml = ####"""
        <p><em>foo <strong>bar *baz bim</strong> bam</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample470() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **foo **bar baz**
        """####

        let commonmarkHtml = ####"""
        <p>**foo <strong>bar baz</strong></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample471() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *foo *bar baz*
        """####

        let commonmarkHtml = ####"""
        <p>*foo <em>bar baz</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample472() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *[bar*](/url)
        """####

        let commonmarkHtml = ####"""
        <p>*<a href="/url">bar*</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample473() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _foo [bar_](/url)
        """####

        let commonmarkHtml = ####"""
        <p>_foo <a href="/url">bar_</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample474() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *<img src="foo" title="*"/>
        """####

        let commonmarkHtml = ####"""
        <p>*<img src="foo" title="*"/></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample475() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **<a href="**">
        """####

        let commonmarkHtml = ####"""
        <p>**<a href="**"></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample476() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __<a href="__">
        """####

        let commonmarkHtml = ####"""
        <p>__<a href="__"></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample477() {
        let parser = MarkdownParser()

        let markdown = ####"""
        *a `*`*
        """####

        let commonmarkHtml = ####"""
        <p><em>a <code>*</code></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample478() {
        let parser = MarkdownParser()

        let markdown = ####"""
        _a `_`_
        """####

        let commonmarkHtml = ####"""
        <p><em>a <code>_</code></em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample479() {
        let parser = MarkdownParser()

        let markdown = ####"""
        **a<http://foo.bar/?q=**>
        """####

        let commonmarkHtml = ####"""
        <p>**a<a href="http://foo.bar/?q=**">http://foo.bar/?q=**</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

    func testExample480() {
        let parser = MarkdownParser()

        let markdown = ####"""
        __a<http://foo.bar/?q=__>
        """####

        let commonmarkHtml = ####"""
        <p>__a<a href="http://foo.bar/?q=__">http://foo.bar/?q=__</a></p>
        """####

        let inkHtml = parser.html(from: markdown)

        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
    }

}

extension EmphasisAndStrongEmphasisTests {
    static var allTests = [
        ("testExample350", testExample350),
        ("testExample351", testExample351),
        ("testExample352", testExample352),
        ("testExample353", testExample353),
        ("testExample354", testExample354),
        ("testExample355", testExample355),
        ("testExample356", testExample356),
        ("testExample357", testExample357),
        ("testExample358", testExample358),
        ("testExample359", testExample359),
        ("testExample360", testExample360),
        ("testExample361", testExample361),
        ("testExample362", testExample362),
        ("testExample363", testExample363),
        ("testExample364", testExample364),
        ("testExample365", testExample365),
        ("testExample366", testExample366),
        ("testExample367", testExample367),
        ("testExample368", testExample368),
        ("testExample369", testExample369),
        ("testExample370", testExample370),
        ("testExample371", testExample371),
        ("testExample372", testExample372),
        ("testExample373", testExample373),
        ("testExample374", testExample374),
        ("testExample375", testExample375),
        ("testExample376", testExample376),
        ("testExample377", testExample377),
        ("testExample378", testExample378),
        ("testExample379", testExample379),
        ("testExample380", testExample380),
        ("testExample381", testExample381),
        ("testExample382", testExample382),
        ("testExample383", testExample383),
        ("testExample384", testExample384),
        ("testExample385", testExample385),
        ("testExample386", testExample386),
        ("testExample387", testExample387),
        ("testExample388", testExample388),
        ("testExample389", testExample389),
        ("testExample390", testExample390),
        ("testExample391", testExample391),
        ("testExample392", testExample392),
        ("testExample393", testExample393),
        ("testExample394", testExample394),
        ("testExample395", testExample395),
        ("testExample396", testExample396),
        ("testExample397", testExample397),
        ("testExample398", testExample398),
        ("testExample399", testExample399),
        ("testExample400", testExample400),
        ("testExample401", testExample401),
        ("testExample402", testExample402),
        ("testExample403", testExample403),
        ("testExample404", testExample404),
        ("testExample405", testExample405),
        ("testExample406", testExample406),
        ("testExample407", testExample407),
        ("testExample408", testExample408),
        ("testExample409", testExample409),
        ("testExample410", testExample410),
        ("testExample411", testExample411),
        ("testExample412", testExample412),
        ("testExample413", testExample413),
        ("testExample414", testExample414),
        ("testExample415", testExample415),
        ("testExample416", testExample416),
        ("testExample417", testExample417),
        ("testExample418", testExample418),
        ("testExample419", testExample419),
        ("testExample420", testExample420),
        ("testExample421", testExample421),
        ("testExample422", testExample422),
        ("testExample423", testExample423),
        ("testExample424", testExample424),
        ("testExample425", testExample425),
        ("testExample426", testExample426),
        ("testExample427", testExample427),
        ("testExample428", testExample428),
        ("testExample429", testExample429),
        ("testExample430", testExample430),
        ("testExample431", testExample431),
        ("testExample432", testExample432),
        ("testExample433", testExample433),
        ("testExample434", testExample434),
        ("testExample435", testExample435),
        ("testExample436", testExample436),
        ("testExample437", testExample437),
        ("testExample438", testExample438),
        ("testExample439", testExample439),
        ("testExample440", testExample440),
        ("testExample441", testExample441),
        ("testExample442", testExample442),
        ("testExample443", testExample443),
        ("testExample444", testExample444),
        ("testExample445", testExample445),
        ("testExample446", testExample446),
        ("testExample447", testExample447),
        ("testExample448", testExample448),
        ("testExample449", testExample449),
        ("testExample450", testExample450),
        ("testExample451", testExample451),
        ("testExample452", testExample452),
        ("testExample453", testExample453),
        ("testExample454", testExample454),
        ("testExample455", testExample455),
        ("testExample456", testExample456),
        ("testExample457", testExample457),
        ("testExample458", testExample458),
        ("testExample459", testExample459),
        ("testExample460", testExample460),
        ("testExample461", testExample461),
        ("testExample462", testExample462),
        ("testExample463", testExample463),
        ("testExample464", testExample464),
        ("testExample465", testExample465),
        ("testExample466", testExample466),
        ("testExample467", testExample467),
        ("testExample468", testExample468),
        ("testExample469", testExample469),
        ("testExample470", testExample470),
        ("testExample471", testExample471),
        ("testExample472", testExample472),
        ("testExample473", testExample473),
        ("testExample474", testExample474),
        ("testExample475", testExample475),
        ("testExample476", testExample476),
        ("testExample477", testExample477),
        ("testExample478", testExample478),
        ("testExample479", testExample479),
        ("testExample480", testExample480),
    ]
}