import XCTest
import Ink

final class BlankLinesTests: XCTestCase {

    func testExample197() {
        let parser = MarkdownParser()

        let markdown = ####"""
          
        
        aaa
          
        
        # aaa
        
          
        """####

        let commonmarkHtml = ####"""
        <p>aaa</p>
        <h1>aaa</h1>
        """####

        let inkHtml = parser.html(from: markdown)

        if inkHtml != commonmarkHtml {
            XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
        }
    }

}

extension BlankLinesTests {
    static var allTests = [
        ("testExample197", testExample197),
    ]
}