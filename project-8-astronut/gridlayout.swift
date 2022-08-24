//
//  gridlayout.swift
//  project-8-astronut
//
//  Created by Roro Solutions on 28/07/22.
//

import SwiftUI

struct gridlayout: View {
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
                            MissionView(missions: mission, astronauts: astronauts)
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
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .cornerRadius(10)
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

struct gridlayout_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        gridlayout(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
    }
}
