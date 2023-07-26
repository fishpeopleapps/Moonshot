//
//  Astronaut.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 7/26/23.
//

import Foundation
/// Holds an Astronaut from the Astronaut JSON file
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
