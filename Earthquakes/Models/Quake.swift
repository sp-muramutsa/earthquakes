/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A structure for representing quake data.
*/

import Foundation

struct Quake {
    let magnitude: Double
    let place: String
    let time: Date
    let code: String
    let detail: URL
    var location: QuakeLocation?
}

extension Quake: Identifiable {
    var id: String { code }
}

extension Quake: Decodable {
    private enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
        case place
        case time
        case code
        case detail
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawMagnitude = try values.decodeIfPresent(Double.self, forKey: .magnitude)
        let rawPlace = try values.decodeIfPresent(String.self, forKey: .place)
        let rawTime = try values.decodeIfPresent(Date.self, forKey: .time)
        let rawCode = try values.decodeIfPresent(String.self, forKey: .code)
        let rawDetail = try values.decodeIfPresent(URL.self, forKey: .detail)

        guard let magnitude = rawMagnitude,
              let place = rawPlace,
              let time = rawTime,
              let code = rawCode,
              let detail = rawDetail else {
            throw QuakeError.missingData
        }

        self.magnitude = magnitude
        self.place = place
        self.time = time
        self.code = code
        self.detail = detail
    }
}
