import XCTest
import Ink

final class HTMLBlocksTests: XCTestCase {

    func testExample118() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <table><tr><td>
        <pre>
        **Hello**,
        
        _world_.
        </pre>
        </td></tr></table>
        """####

        let commonmarkHtml = ####"""
        <table><tr><td>
        <pre>
        **Hello**,
        <p><em>world</em>.
        </pre></p>
        </td></tr></table>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample119() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <table>
          <tr>
            <td>
                   hi
            </td>
          </tr>
        </table>
        
        okay.
        """####

        let commonmarkHtml = ####"""
        <table>
          <tr>
            <td>
                   hi
            </td>
          </tr>
        </table>
        <p>okay.</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample120() {
        let parser = MarkdownParser()

        let markdown = ####"""
         <div>
          *hello*
                 <foo><a>
        """####

        let commonmarkHtml = ####"""
         <div>
          *hello*
                 <foo><a>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample121() {
        let parser = MarkdownParser()

        let markdown = ####"""
        </div>
        *foo*
        """####

        let commonmarkHtml = ####"""
        </div>
        *foo*
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample122() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <DIV CLASS="foo">
        
        *Markdown*
        
        </DIV>
        """####

        let commonmarkHtml = ####"""
        <DIV CLASS="foo">
        <p><em>Markdown</em></p>
        </DIV>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample123() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div id="foo"
          class="bar">
        </div>
        """####

        let commonmarkHtml = ####"""
        <div id="foo"
          class="bar">
        </div>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample124() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div id="foo" class="bar
          baz">
        </div>
        """####

        let commonmarkHtml = ####"""
        <div id="foo" class="bar
          baz">
        </div>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample125() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div>
        *foo*
        
        *bar*
        """####

        let commonmarkHtml = ####"""
        <div>
        *foo*
        <p><em>bar</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample126() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div id="foo"
        *hi*
        """####

        let commonmarkHtml = ####"""
        <div id="foo"
        *hi*
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample127() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div class
        foo
        """####

        let commonmarkHtml = ####"""
        <div class
        foo
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample128() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div *???-&&&-<---
        *foo*
        """####

        let commonmarkHtml = ####"""
        <div *???-&&&-<---
        *foo*
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample129() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div><a href="bar">*foo*</a></div>
        """####

        let commonmarkHtml = ####"""
        <div><a href="bar">*foo*</a></div>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample130() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <table><tr><td>
        foo
        </td></tr></table>
        """####

        let commonmarkHtml = ####"""
        <table><tr><td>
        foo
        </td></tr></table>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample131() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div></div>
        ``` c
        int x = 33;
        ```
        """####

        let commonmarkHtml = ####"""
        <div></div>
        ``` c
        int x = 33;
        ```
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample132() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <a href="foo">
        *bar*
        </a>
        """####

        let commonmarkHtml = ####"""
        <a href="foo">
        *bar*
        </a>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample133() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <Warning>
        *bar*
        </Warning>
        """####

        let commonmarkHtml = ####"""
        <Warning>
        *bar*
        </Warning>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample134() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <i class="foo">
        *bar*
        </i>
        """####

        let commonmarkHtml = ####"""
        <i class="foo">
        *bar*
        </i>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample135() {
        let parser = MarkdownParser()

        let markdown = ####"""
        </ins>
        *bar*
        """####

        let commonmarkHtml = ####"""
        </ins>
        *bar*
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample136() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <del>
        *foo*
        </del>
        """####

        let commonmarkHtml = ####"""
        <del>
        *foo*
        </del>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample137() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <del>
        
        *foo*
        
        </del>
        """####

        let commonmarkHtml = ####"""
        <del>
        <p><em>foo</em></p>
        </del>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample138() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <del>*foo*</del>
        """####

        let commonmarkHtml = ####"""
        <p><del><em>foo</em></del></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample139() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <pre language="haskell"><code>
        import Text.HTML.TagSoup
        
        main :: IO ()
        main = print $ parseTags tags
        </code></pre>
        okay
        """####

        let commonmarkHtml = ####"""
        <pre language="haskell"><code>
        import Text.HTML.TagSoup
        
        main :: IO ()
        main = print $ parseTags tags
        </code></pre>
        <p>okay</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample140() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <script type="text/javascript">
        // JavaScript example
        
        document.getElementById("demo").innerHTML = "Hello JavaScript!";
        </script>
        okay
        """####

        let commonmarkHtml = ####"""
        <script type="text/javascript">
        // JavaScript example
        
        document.getElementById("demo").innerHTML = "Hello JavaScript!";
        </script>
        <p>okay</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample141() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <style
          type="text/css">
        h1 {color:red;}
        
        p {color:blue;}
        </style>
        okay
        """####

        let commonmarkHtml = ####"""
        <style
          type="text/css">
        h1 {color:red;}
        
        p {color:blue;}
        </style>
        <p>okay</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample142() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <style
          type="text/css">
        
        foo
        """####

        let commonmarkHtml = ####"""
        <style
          type="text/css">
        
        foo
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample143() {
        let parser = MarkdownParser()

        let markdown = ####"""
        > <div>
        > foo
        
        bar
        """####

        let commonmarkHtml = ####"""
        <blockquote>
        <div>
        foo
        </blockquote>
        <p>bar</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample144() {
        let parser = MarkdownParser()

        let markdown = ####"""
        - <div>
        - foo
        """####

        let commonmarkHtml = ####"""
        <ul>
        <li>
        <div>
        </li>
        <li>foo</li>
        </ul>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample145() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <style>p{color:red;}</style>
        *foo*
        """####

        let commonmarkHtml = ####"""
        <style>p{color:red;}</style>
        <p><em>foo</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample146() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <!-- foo -->*bar*
        *baz*
        """####

        let commonmarkHtml = ####"""
        <!-- foo -->*bar*
        <p><em>baz</em></p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample147() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <script>
        foo
        </script>1. *bar*
        """####

        let commonmarkHtml = ####"""
        <script>
        foo
        </script>1. *bar*
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample148() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <!-- Foo
        
        bar
           baz -->
        okay
        """####

        let commonmarkHtml = ####"""
        <!-- Foo
        
        bar
           baz -->
        <p>okay</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample149() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <?php
        
          echo '>';
        
        ?>
        okay
        """####

        let commonmarkHtml = ####"""
        <?php
        
          echo '>';
        
        ?>
        <p>okay</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample150() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <!DOCTYPE html>
        """####

        let commonmarkHtml = ####"""
        <!DOCTYPE html>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample151() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <![CDATA[
        function matchwo(a,b)
        {
          if (a < b && a < 0) then {
            return 1;
        
          } else {
        
            return 0;
          }
        }
        ]]>
        okay
        """####

        let commonmarkHtml = ####"""
        <![CDATA[
        function matchwo(a,b)
        {
          if (a < b && a < 0) then {
            return 1;
        
          } else {
        
            return 0;
          }
        }
        ]]>
        <p>okay</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample152() {
        let parser = MarkdownParser()

        let markdown = ####"""
          <!-- foo -->
        
            <!-- foo -->
        """####

        let commonmarkHtml = ####"""
          <!-- foo -->
        <pre><code>&lt;!-- foo --&gt;
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample153() {
        let parser = MarkdownParser()

        let markdown = ####"""
          <div>
        
            <div>
        """####

        let commonmarkHtml = ####"""
          <div>
        <pre><code>&lt;div&gt;
        </code></pre>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample154() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        <div>
        bar
        </div>
        """####

        let commonmarkHtml = ####"""
        <p>Foo</p>
        <div>
        bar
        </div>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample155() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div>
        bar
        </div>
        *foo*
        """####

        let commonmarkHtml = ####"""
        <div>
        bar
        </div>
        *foo*
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample156() {
        let parser = MarkdownParser()

        let markdown = ####"""
        Foo
        <a href="bar">
        baz
        """####

        let commonmarkHtml = ####"""
        <p>Foo
        <a href="bar">
        baz</p>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample157() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div>
        
        *Emphasized* text.
        
        </div>
        """####

        let commonmarkHtml = ####"""
        <div>
        <p><em>Emphasized</em> text.</p>
        </div>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample158() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <div>
        *Emphasized* text.
        </div>
        """####

        let commonmarkHtml = ####"""
        <div>
        *Emphasized* text.
        </div>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample159() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <table>
        
        <tr>
        
        <td>
        Hi
        </td>
        
        </tr>
        
        </table>
        """####

        let commonmarkHtml = ####"""
        <table>
        <tr>
        <td>
        Hi
        </td>
        </tr>
        </table>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

    func testExample160() {
        let parser = MarkdownParser()

        let markdown = ####"""
        <table>
        
          <tr>
        
            <td>
              Hi
            </td>
        
          </tr>
        
        </table>
        """####

        let commonmarkHtml = ####"""
        <table>
          <tr>
        <pre><code>&lt;td&gt;
          Hi
        &lt;/td&gt;
        </code></pre>
          </tr>
        </table>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension HTMLBlocksTests {
    static var allTests = [
        ("testExample118", testExample118),
        ("testExample119", testExample119),
        ("testExample120", testExample120),
        ("testExample121", testExample121),
        ("testExample122", testExample122),
        ("testExample123", testExample123),
        ("testExample124", testExample124),
        ("testExample125", testExample125),
        ("testExample126", testExample126),
        ("testExample127", testExample127),
        ("testExample128", testExample128),
        ("testExample129", testExample129),
        ("testExample130", testExample130),
        ("testExample131", testExample131),
        ("testExample132", testExample132),
        ("testExample133", testExample133),
        ("testExample134", testExample134),
        ("testExample135", testExample135),
        ("testExample136", testExample136),
        ("testExample137", testExample137),
        ("testExample138", testExample138),
        ("testExample139", testExample139),
        ("testExample140", testExample140),
        ("testExample141", testExample141),
        ("testExample142", testExample142),
        ("testExample143", testExample143),
        ("testExample144", testExample144),
        ("testExample145", testExample145),
        ("testExample146", testExample146),
        ("testExample147", testExample147),
        ("testExample148", testExample148),
        ("testExample149", testExample149),
        ("testExample150", testExample150),
        ("testExample151", testExample151),
        ("testExample152", testExample152),
        ("testExample153", testExample153),
        ("testExample154", testExample154),
        ("testExample155", testExample155),
        ("testExample156", testExample156),
        ("testExample157", testExample157),
        ("testExample158", testExample158),
        ("testExample159", testExample159),
        ("testExample160", testExample160),
    ]
}