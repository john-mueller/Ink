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
        var data: Data?

        print("Trying to fetch local test data")

        do {
            data = try Data(contentsOf: specFileURL)
        } catch {
            print("Could not load spec.json from local cache: \(specFileURL)")
            print("Error: \(error)")
        }

        if let loadedData = data {
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                do {
                    defer { print("Test generation successful") }
                    return try decodeTests(from: loadedData)
                } catch {
                    print("Could not decode local test data")
                    print("Error: \(error)")
                }
            }
        }

        print("Trying to fetch remote test data")

        do {
            data = try Data(contentsOf: remoteURL)
        } catch {
            print("Could not load spec.json from remote URL: \(remoteURL)")
            print("Error: \(error)")
        }

        guard let loadedData = data else {
            print("Could not load spec.json locally or remotely")
            print("Test generation unsuccessful")
            exit(1)
        }

        if !FileManager.default.fileExists(atPath: specFileURL.absoluteString) {
            do {
                try loadedData.write(to: specFileURL)
            } catch {
                print("Could not save local cache at \(specFileURL)")
                print("Error: \(error)")
            }
        }

        do {
            defer { print("Test generation successful") }
            return try decodeTests(from: loadedData)
        } catch {
            print("Could not decode remote test data")
            print("Error: \(error)")
        }

        print("Could not decode spec.json locally or remotely")
        print("Test generation unsuccessful")
        exit(1)
    }()

    private static func decodeTests(from data: Data) throws -> [CMTest] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([CMTest].self, from: data)
    }
}
