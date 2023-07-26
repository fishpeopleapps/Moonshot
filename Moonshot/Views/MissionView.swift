//
//  MissionView.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 7/26/23.
//
// TODO: Add the launch date below the mission badge
// TODO: Extract the horizontal scrollview into it's own view

import SwiftUI
/// Detail view for the missions
struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    let crew: [CrewMember]
    /// View
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
                        .font(.title.bold())
                        .textCase(.uppercase)
                        .padding(.bottom, 5)
                    Divider()
                    VStack(alignment: .leading) {

                        Text(mission.description)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal)
                    Divider()
                        Text("Crew")
                            .foregroundStyle(Color.white)
                            .font(.headline)
                            .textCase(.uppercase)

                    .padding(.leading, 10)
                    Divider()
                    /// Bottom scroll with non-default settings
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(Capsule())
                                        .overlay(
                                        Capsule()
                                        /// StrokeBorder - draws the stroke INSIDE the image, rather than the standard
                                        /// half inside/half outside
                                            .strokeBorder(.white, lineWidth: 1)
                                        )
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(Color.white)
                                            .font(.headline)
                                        Text(crewMember.role)
                                            .foregroundStyle(Color.white.opacity(0.7))
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
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
                /// we found the crew member
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}
