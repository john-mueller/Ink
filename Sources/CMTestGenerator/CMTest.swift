import Foundation
#if !canImport(ObjectiveC)
import FoundationNetworking
#endif

struct CMTest: Codable {
    var markdown: String
    var html: String
    var example: Int
    var startLine: Int
    var endLine: Int
    var section: String
}

extension CMTest {
    static let allTests: [CMTest] = {
        guard let url = URL(string: "https://spec.commonmark.org/0.29/spec.json") else {
            print("Bad URL")
            exit(1)
        }

        do {
            let data = try Data(contentsOf: url)

            try data.write(to: specFileURL)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            return try decoder.decode([CMTest].self, from: data)
        } catch {
            print(error)
            exit(1)
        }
    }()
}
