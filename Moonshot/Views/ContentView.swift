//
//  ContentView.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 7/26/23.
//
// TODO: AppIcon
// TODO: Change the navigation color
// TODO: Add a toolbar item that toggles between showing a grid vs a list
// TODO: Install custom space font for titles

import SwiftUI

struct ContentView: View {
    /// This worked before we made our update to the Decoder extension
    /// let astronauts = Bundle.main.decode("astronauts.json")
    /// Fixed version below - loads our Astronauts AND missions
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    /// View
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                // TODO: Move this image out (I think you could just do resizable and scaledToFit and use it in many places)
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
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
