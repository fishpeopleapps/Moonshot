//
//  MissionView.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 7/26/23.
//

import SwiftUI
/// Detail view for the missions
struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember] // not sure if i need this in here?
    // View
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.bottom, 8)
                    Divider()
                    Text("Mission Highlights")
                        .font(.custom("SpaceMono-Regular", size: 30))
                        .padding(.bottom, 5)
                    Text("Launch Date: \(mission.formattedLaunchDate)")
                        .font(.custom("SpaceMono-Regular", size: 15))
                    Divider()
                    VStack(alignment: .leading) {
                        Text(mission.description)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal)
                    Divider()
                    Text("Crew")
                        .font(.custom("SpaceMono-Regular", size: 25))
                        .textCase(.uppercase)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10)
                    Divider()
                    // Bottom scroll with non-default settings
                    CrewView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    /// After a particular mission has been selected, this will locate the crew members and
    /// look to the Astronauts.json to find them, then we'll add them to our 'crew' array
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                // we found the crew member
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}
