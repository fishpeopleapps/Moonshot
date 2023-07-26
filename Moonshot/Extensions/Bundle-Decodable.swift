//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 7/26/23.
//

import Foundation

// This was the extension we used for decoding just the Astronaut file
// extension Bundle {
//    func decode(_ file: String) -> [String: Astronaut] {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle")
//        }
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle")
//        }
//        let decoder = JSONDecoder()
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle")
//        }
//        return loaded
//    }
// }

/// This is the updated extension that can handle decoding the multi-layered Mission AND Astronaut file
/// it uses generics (Thing)
extension Bundle {
    func decode<Thing: Codable>(_ file: String) -> Thing { // takes a thing that's codable, returns a thing
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        let decoder = JSONDecoder()
        /// This was added just for formatting the date --->
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        /// <---
        guard let loaded = try? decoder.decode(Thing.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        return loaded
    }
}
