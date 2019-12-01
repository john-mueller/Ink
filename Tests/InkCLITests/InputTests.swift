/**
 *  Ink
 *  Copyright (c) John Sundell 2019
 *  MIT license, see LICENSE file for details
 */

import XCTest

final class InputTests: XCTestCase {
    static let tempDirPath = "/tmp/Ink"

    class override func setUp() {
        let fileManager = FileManager.default
        let dataDirPath = "\(tempDirPath)/data"

        try? fileManager.removeItem(atPath: dataDirPath)
        try? fileManager.createDirectory(atPath: "\(dataDirPath)/subdir1", withIntermediateDirectories: true)
        try? fileManager.createDirectory(atPath: "\(dataDirPath)/subdir2", withIntermediateDirectories: true)

        let string = "*Hello World*"
        let data = Data(string.utf8)

        fileManager.createFile(atPath: "\(dataDirPath)/file.md", contents: data)
        fileManager.createFile(atPath: "\(dataDirPath)/subdir1/file.md", contents: data)
        fileManager.createFile(atPath: "\(dataDirPath)/subdir2/file.md", contents: data)
    }

    func testVerifyTempFilesExist() {
        let fileManager = FileManager.default
        let dataDirPath = "\(InputTests.tempDirPath)/data"

        XCTAssert(
            fileManager.fileExists(atPath: "\(dataDirPath)/file.md") &&
                fileManager.fileExists(atPath: "\(dataDirPath)/subdir1/file.md") &&
                fileManager.fileExists(atPath: "\(dataDirPath)/subdir2/file.md"),
            "Could not verify test data at \(dataDirPath)\nCheck your permissions for \(InputTests.tempDirPath)")
    }

    func testVerifyTestingSymlinkInstalled() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        if [ -f "\(binaryPath)" ]; then
        echo "\(binaryPath) exists"
        fi
        """
        let (output, error) = bash(command)
        let expected = "\(binaryPath) exists\n"
        
        if output != expected || error != "" {
            XCTFail("""
                Could not find symlink at \(binaryPath)
                Please run 'swift build; mkdir -p /tmp/Ink; ln -s \"$PWD/.build/debug/ink-cli" /tmp/Ink/ink' in Ink package directory
                """)
        }
    }

    func testMarkdownInputShortFlag() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        \(binaryPath) -m "*Hello World*"
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }

    func testMarkdownInputLongFlag() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        \(binaryPath) --markdown "*Hello World*"
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }
    
    func testPipeInput() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        echo "*Hello World*" | \(binaryPath)
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"
        
        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }
    
    func testStdinInputViaHereDoc() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        \(binaryPath) << EOF
        *Hello World*
        EOF
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"
        
        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }

    func testStdinInputViaHereString() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        \(binaryPath) <<< "*Hello World*"
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }

    func testRedirectionInput() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let dataDirPath = "\(InputTests.tempDirPath)/data"
        let command = """
        cd \(dataDirPath)
        \(binaryPath) < file.md
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }
    
    func testFileInput() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let dataDirPath = "\(InputTests.tempDirPath)/data"
        let command = """
        cd \(dataDirPath)
        \(binaryPath) file.md
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"
        
        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }
    
    func testFileInputFromParentDirectory() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let dataDirPath = "\(InputTests.tempDirPath)/data"
        let command = """
        cd \(dataDirPath)
        \(binaryPath) subdir1/file.md
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"
        
        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }
    
    func testFileInputFromChildDirectory() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let dataDirPath = "\(InputTests.tempDirPath)/data"
        let command = """
        cd \(dataDirPath)/subdir1
        \(binaryPath) ../file.md
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"
        
        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }
    
    func testFileInputFromSiblingDirectory() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let dataDirPath = "\(InputTests.tempDirPath)/data"
        let command = """
        cd \(dataDirPath)/subdir1
        \(binaryPath) ../subdir2/file.md
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"
        
        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }

    func testFileInputWithAbsolutePath() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let dataDirPath = "\(InputTests.tempDirPath)/data"
        let command = """
        \(binaryPath) \(dataDirPath)/file.md
        """
        let (output, error) = bash(command)
        let expected = "<p><em>Hello World</em></p>\n"

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }

    func testMissingMarkdownString() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        \(binaryPath) -m
        """
        let (output, error) = bash(command)
        let expected = usageMessage

        XCTAssertEqual(output, "")
        XCTAssertTrue(error.contains(expected), "Error does not end with usage message")
    }

    func testCannotReadFile() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        \(binaryPath) qwerty-fake-file.md
        """
        let (output, error) = bash(command)
        let expected = usageMessage

        XCTAssertEqual(output, "")
        XCTAssertTrue(error.contains(expected), "Error does not end with usage message")
    }

    func testTooManyArguments() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        let command = """
        \(binaryPath) file1.md file2.md file3.md
        """
        let (output, error) = bash(command)
        let expected = usageMessage

        XCTAssertEqual(output, "")
        XCTAssertTrue(error.contains(expected), "Error does not end with usage message")
    }

    func testHelpFlags() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        var command = """
        \(binaryPath) --help
        """
        var (output, error) = bash(command)
        let expected = helpMessage + "\n"

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")

        command = """
        \(binaryPath) -h
        """
        (output, error) = bash(command)

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")

        command = """
        \(binaryPath) file.md --help
        """
        (output, error) = bash(command)

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")

        command = """
        \(binaryPath) --help file1.md file2.md
        """
        (output, error) = bash(command)

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")

        command = """
        \(binaryPath) --help --version
        """
        (output, error) = bash(command)

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")

        command = """
        \(binaryPath) -m file.md --help
        """
        (output, error) = bash(command)

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }

    func testVersionFlag() {
        let binaryPath = "\(InputTests.tempDirPath)/ink"
        var command = """
        \(binaryPath) --version
        """
        var (output, error) = bash(command)
        let expected = versionMessage + "\n"

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")

        command = """
        \(binaryPath) file.md --version
        """
        (output, error) = bash(command)

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")

        command = """
        \(binaryPath) --version file1.md file2.md
        """
        (output, error) = bash(command)

        XCTAssertEqual(output, expected)
        XCTAssertEqual(error, "")
    }
}

extension InputTests {
    static var allTests: Linux.TestList<InputTests> {
        return [
            ("testVerifyTempFilesExist", testVerifyTempFilesExist),
            ("testVerifyTestingSymlinkInstalled", testVerifyTestingSymlinkInstalled),
            ("testMarkdownInputShortFlag", testMarkdownInputShortFlag),
            ("testMarkdownInputLongFlag", testMarkdownInputLongFlag),
            ("testPipeInput", testPipeInput),
            ("testStdinInputViaHereDoc", testStdinInputViaHereDoc),
            ("testStdinInputViaHereString", testStdinInputViaHereString),
            ("testRedirectionInput", testRedirectionInput),
            ("testFileInput", testFileInput),
            ("testFileInputFromParentDirectory", testFileInputFromParentDirectory),
            ("testFileInputFromChildDirectory", testFileInputFromChildDirectory),
            ("testFileInputFromSiblingDirectory", testFileInputFromSiblingDirectory),
            ("testFileInputWithAbsolutePath", testFileInputWithAbsolutePath),
            ("testMissingMarkdownString", testMissingMarkdownString),
            ("testCannotReadFile", testCannotReadFile),
            ("testTooManyArguments", testTooManyArguments),
            ("testHelpFlags", testHelpFlags),
            ("testVersionFlag", testVersionFlag),
        ]
    }
}

@discardableResult private func bash(_ command: String) -> (standardOut: String, standardError: String) {
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["-c", command]
    
    let outPipe = Pipe()
    let errorPipe = Pipe()
    task.standardOutput = outPipe
    task.standardError = errorPipe
    task.launch()
    
    let outData = outPipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: outData, encoding: .utf8) ?? ""

    let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
    let error = String(data: errorData, encoding: .utf8) ?? ""
    
    return (output, error)
}
