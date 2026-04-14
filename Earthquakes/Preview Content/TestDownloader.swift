//
//  TestDownloader.swift
//  Earthquakes
//
//  Created by sandrine Bakuramutsa on 4/13/26.
//

import Foundation

final class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(for: .milliseconds(.random(in: 100...500)))
        return testQuakesData
    }
}
