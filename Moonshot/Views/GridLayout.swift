//
//  GridLayout.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 8/5/23.
//

import SwiftUI

struct GridLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(Color.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(Color.white.opacity(0.7))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}
