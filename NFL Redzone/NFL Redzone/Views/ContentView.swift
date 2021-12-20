//
//  ContentView.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 27/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    //: MARK: - PROPERTIES
    
    @State private var games = [Event]()
    @State private var isError: Bool = false
    
    // TOGGLE FOR MODAL SHEET
    @State private var showingSheet = false
    
    
    //: MARK: - FUNCTIONS
    
    // load in users fleaflicker leagues
    func loadGameData() {
        guard let url = URL(string: "https://site.api.espn.com/apis/site/v2/sports/football/nfl/scoreboard") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedReponse = try JSONDecoder().decode(EventResponse.self, from: data)

                    DispatchQueue.main.async {
                        self.games = decodedReponse.events
                        self.isError = false
                    }

                    return
                } catch {
                    print(error)
                    self.isError = true
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    
    //: MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(Array(games).sorted { $0.status.type.state < $1.status.type.state }, id: \.self) { game in

                    VStack(alignment: .leading) {
                                                
                        MatchupRowView(
                            homeTeam: game.competitions[0].competitors[0],
                            awayTeam: game.competitions[0].competitors[1],
                            situation: game.competitions[0].situation ?? nil,
                            clock: game.status.displayClock,
                            period: game.status.period,
                            downDistance: game.competitions[0].situation?.downDistanceText ?? game.status.type.description,
                            redzone: getRedzoneStatus(
                                gameStatus: game.status.type.description,
                                isRedzone: game.competitions[0].situation?.isRedZone ?? false
                            )
                        )
                        
                        // Text(game.status.type.state)
                        // Text(game.competitions[0].situation?.lastPlay.team.id ?? "N/A")

                    } //: VSTACK
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(
                            getRedzoneStatus(
                                gameStatus: game.status.type.description,
                                isRedzone: game.competitions[0].situation?.isRedZone ?? false
                            ) ? Color.red : Color("cell-bg")
                        )
                    )
                    .onTapGesture {
                        showingSheet = true
                    }
                    
                } //: FOREACH
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
            } //: LIST
            .environment(\.defaultMinListRowHeight, 20) 
            .refreshable {
                loadGameData()
            }
            .navigationBarTitle("Redzone", displayMode: .inline)
            .listStyle(PlainListStyle())
            .onAppear(perform: loadGameData)
            .sheet(isPresented: $showingSheet, content: {
                MatchDetailView()
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
