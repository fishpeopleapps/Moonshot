//
//  ContentView.swift
//  Moonshot
//
//  Created by Kimberly Brewer on 7/26/23.
//

import SwiftUI

struct ContentView: View {
    /// This worked before we made our update to the Decoder extension
    /// let astronauts = Bundle.main.decode("astronauts.json")
    /// Fixed version below - loads our Astronauts AND missions
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var isShowingList = false
    /// View
    var body: some View {
        NavigationView {
            VStack {
                Text("MOONSHOT")
                    .font(.custom("SpaceMono-Bold", size: 65, relativeTo: .title))
                    .padding(.top, 15)
                    if isShowingList {
                            ListLayout(astronauts: astronauts, missions: missions)
                    } else {
                        GridLayout(astronauts: astronauts, missions: missions)
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            isShowingList.toggle()
                        }
                    } label: {
                        Text(isShowingList ? "Grid View" : "List View")
                    }
                }
            }
        }
        // Changes the navigation '< Back' color
        .tint(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
