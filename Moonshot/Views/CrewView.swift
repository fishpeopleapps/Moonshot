//
//  CrewView.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 8/5/23.
//

import SwiftUI

/// Horizontal ScrollView that shows the image of a crew member, then their name and position
/// Used in 'MissionView'
struct CrewView: View {
    let crew: [CrewMember]
    var body: some View {
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
                            .font(.custom("SpaceMono-Regular", size: 15))
                            .textCase(.uppercase)
                            .foregroundStyle(Color.white)
                        Text(crewMember.role)
                            .foregroundStyle(Color.white.opacity(0.7))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    }
}
