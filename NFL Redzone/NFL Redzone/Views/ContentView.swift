//
//  ContentView.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 27/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    //: MARK: - PROPERTIES
    
    // All the games returned from the api (possibly redundant)
    @State private var games = [Event]()
    // Three vars to store the filtered results
    @State private var gamesLive = [Event]()
    @State private var gamesCompleted = [Event]()
    @State private var gamesScheduled = [Event]()
    
    // Passed in var from the tab view to define which filter is shown
    // 1: pre, 2: in, 3: post
    var gameFilter: Int
    
    // Var to handle optional api error message
    @State private var isError: Bool = false
    
    // Var to hangle the toggling of the modal sheet
    @State private var showingSheet = false
    
    
    //: MARK: - FUNCTIONS
    
    // load in the games from the api
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
                        
                        // Store all games into a var
                        self.games = decodedReponse.events
                        
                        // Store filtered games into three separate vars for Scheduled, Live and Completed games
                        self.gamesLive = games.filter { $0.status.type.state == "in" }
                        self.gamesScheduled = games.filter { $0.status.type.state == "pre" }
                        self.gamesCompleted = games.filter { $0.status.type.state == "post" }
                        
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
            
            var gamesTemp = getGameFilter(gameFilter: gameFilter, gamesLive: gamesLive, gamesCompleted: gamesCompleted, gamesScheduled: gamesScheduled)
            

            List {
                
                // Pass values into the getGameFilter function and return an array of games depending on which tab the user selects
                ForEach(Array(gamesTemp), id: \.self) { game in

                    VStack(alignment: .leading) {
                                                
                        MatchupRowView(
                            homeTeam: game.competitions[0].competitors[0],
                            awayTeam: game.competitions[0].competitors[1],
                            situation: game.competitions[0].situation ?? nil,
                            clock: game.status.displayClock,
                            period: game.status.period,
                            clockPeriod: game.status.type.shortDetail,
                            downDistance: game.competitions[0].situation?.downDistanceText ?? game.status.type.description,
                            redzone: getRedzoneStatus(
                                gameStatus: game.status.type.description,
                                isRedzone: game.competitions[0].situation?.isRedZone ?? false
                            )
                        )

                    } //: VSTACK
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(
                            getRedzoneStatus(
                                gameStatus: game.status.type.description,
                                isRedzone: game.competitions[0].situation?.isRedZone ?? false
                            ) ? Color("redzone-bg") : Color("cell-bg")
                        )
                    )
                    .onTapGesture {
                        // added to allow for future use of a details panel
                        // showingSheet = true
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
                MatchupDetailView()
            })
            .overlay(Group {
                if gamesTemp.isEmpty {
                    Text("No Games")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            })
                
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameFilter: 2)
    }
}
