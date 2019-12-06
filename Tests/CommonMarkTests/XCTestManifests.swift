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