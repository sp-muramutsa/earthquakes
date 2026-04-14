//
//  QuakesProvider.swift
//  Earthquakes
//
//  Created by sandrine Bakuramutsa on 4/13/26.
//

import Foundation
import Observation


@Observable
class QuakesProvider {
    var quakes: [Quake] = []
    let client: QuakeClient
    
    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }
    
    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
    
    func location(for quake: Quake) async throws -> QuakeLocation {
        return try await client.quakeLocation(from: quake.detail)
    }
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}

