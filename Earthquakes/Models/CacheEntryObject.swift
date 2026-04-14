//
//  CacheEntryObject.swift
//  Earthquakes
//
//  Created by sandrine Bakuramutsa on 4/13/26.
//

import Foundation

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}

enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
