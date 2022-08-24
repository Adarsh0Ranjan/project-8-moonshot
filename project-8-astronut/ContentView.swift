//
//  ContentView.swift
//  project-8-astronut
//
//  Created by Roro Solutions on 27/07/22.
//


import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = false
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    gridlayout(astronauts: astronauts, missions: missions) 
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Image(systemName: "list.bullet")
                    } else {
                        Image(systemName: "square.grid.3x3")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
