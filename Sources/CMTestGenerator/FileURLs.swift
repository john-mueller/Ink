import Foundation

internal var packageFolderURL: URL {
    URL(fileURLWithPath: #file)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
}

internal var specFileURL: URL {
    packageFolderURL
        .appendingPathComponent(".build")
        .appendingPathComponent("spec.json")
}

internal var commonmarkFolderURL: URL {
    packageFolderURL
        .appendingPathComponent("Tests")
        .appendingPathComponent("CommonMarkTests")
}

internal let cleanURL = commonmarkFolderURL
    .appendingPathComponent("Clean.swift")

internal let xcTestManifestURL = commonmarkFolderURL
    .appendingPathComponent("XCTestManifests.swift")
