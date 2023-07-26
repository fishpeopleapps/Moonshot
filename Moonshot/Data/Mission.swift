//
//  Mission.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 7/26/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    /// Nested struct because each mission has a crew/role section
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    /// What the outer mission contains
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    /// Simplifies the display name with Apollo + a dynamic number
    var displayName: String {
        "Apollo \(id)"
    }
    /// Gets the image name dynamically
    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
