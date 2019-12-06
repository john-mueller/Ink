import Foundation

internal func makeXCTests() {
    let cleanString = """
    import SwiftSoup

    public enum CleaningError: Error { case noBody }

    public func clean(_ html: String) throws -> String {
        let doc = try SwiftSoup.parse(html)
        guard let cleanHTML = try doc.body()?.html() else {
            throw CleaningError.noBody
        }

        return cleanHTML
            .components(separatedBy: "\\n")
            .map({
                $0.trimmingCharacters(in: .whitespaces)
                    .replacingOccurrences(of: "<br> ", with: "<br>")
            })
            .filter { !$0.isEmpty }
            .joined(separator: "\\n")
    }
    """

    let xcTestManifestsString = """
    import XCTest

    #if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(ATXHeadingsTests.allTests),
            testCase(AutolinksTests.allTests),
            testCase(BackslashEscapesTests.allTests),
            testCase(BlankLinesTests.allTests),
            testCase(BlockQuotesTests.allTests),
            testCase(CodeSpansTests.allTests),
            testCase(EmphasisAndStrongEmphasisTests.allTests),
            testCase(EntityAndNumericCharacterReferencesTests.allTests),
            testCase(FencedCodeBlocksTests.allTests),
            testCase(HTMLBlocksTests.allTests),
            testCase(HardLineBreaksTests.allTests),
            testCase(ImagesTests.allTests),
            testCase(IndentedCodeBlocksTests.allTests),
            testCase(InlinesTests.allTests),
            testCase(LinkReferenceDefinitionsTests.allTests),
            testCase(LinksTests.allTests),
            testCase(ListItemsTests.allTests),
            testCase(ListsTests.allTests),
            testCase(ParagraphsTests.allTests),
            testCase(PrecedenceTests.allTests),
            testCase(RawHTMLTests.allTests),
            testCase(SetextHeadingsTests.allTests),
            testCase(SoftLineBreaksTests.allTests),
            testCase(TabsTests.allTests),
            testCase(TextualContentTests.allTests),
            testCase(ThematicBreaksTests.allTests)
        ]
    }
    #endif
    """

    do {
        try cleanString.write(to: cleanURL, atomically: true, encoding: .utf8)
        try xcTestManifestsString.write(to: xcTestManifestURL, atomically: true, encoding: .utf8)
    } catch {
        print(error)
        exit(1)
    }

    var classContent = [String: (testText: String, testNames: [String])]()

    CMTest.allTests.forEach { test in
        let sectionTitle = test.section
            .components(separatedBy: .whitespaces)
            .map { $0.prefix(1).uppercased() + $0.dropFirst() }
            .joined()

        classContent[sectionTitle, default: ("", [])].testText.append(#####"""
                func testExample\#####(test.example)() {
                    let parser = MarkdownParser()

                    let markdown = ####"""
                    \#####(indent(String(test.markdown.dropLast(1))))        """####

                    let commonmarkHtml = ####"""
                    \#####(indent(String(test.html.dropLast(1))))        """####

                    let inkHtml = parser.html(from: markdown)

                    if inkHtml != commonmarkHtml {
                        XCTAssertEqual(try clean(inkHtml), try clean(commonmarkHtml))
                    }
                }


            """#####)

        classContent[sectionTitle, default: ("", [])].testNames.append("testExample\(test.example)")
    }

    classContent.keys.forEach { sectionTitle in
        var string = """
        import XCTest
        import Ink

        final class \(sectionTitle)Tests: XCTestCase {


        """

        string.append(classContent[sectionTitle]!.testText)

        string.append("""
        }

        extension \(sectionTitle)Tests {
            static var allTests = [
            \("    " + classContent[sectionTitle]!.testNames
            .map { "(\"\($0)\", \($0))," }
            .joined(separator: "\n        "))
            ]
        }
        """)

        let url = commonmarkFolderURL
            .appendingPathComponent("\(sectionTitle)Tests.swift")

        do {
            try string.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print(error)
            exit(1)
        }
    }
}

private func indent(_ string: String) -> String {
    let lines = string.components(separatedBy: "\n")
    var string = lines[0] + "\n"
    for line in lines.dropFirst() {
        string += "        \(line)\n"
    }
    return string
}

