import SwiftSoup

public enum CleaningError: Error { case noBody }

public func clean(_ html: String) throws -> String {
    let doc = try SwiftSoup.parse(html)
    guard let cleanHTML = try doc.body()?.html() else {
        throw CleaningError.noBody
    }

    return cleanHTML
        .components(separatedBy: "\n")
        .map({
            $0.trimmingCharacters(in: .whitespaces)
                .replacingOccurrences(of: "<br> ", with: "<br>")
        })
        .filter { !$0.isEmpty }
        .joined(separator: "\n")
}